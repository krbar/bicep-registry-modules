targetScope = 'subscription'
metadata name = 'Landing Zone - Defaults'
metadata description = 'Deploys the landing zone with defaults.'

// Parameters
@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-bicep-${serviceShort}-rg'

import { enforcedLocation } from '../../shared/constants.bicep'

@description('Optional. Short identifier for the test kind. Keep short to avoid name-length issues.')
param serviceShort string = 'ailzmin'

@description('Optional. A token injected by CI for uniqueness.')
param namePrefix string = '#_namePrefix_#'

// Keep 12 chars to match baseName default constraints
var _seed = toLower('${namePrefix}${serviceShort}')
var workloadName = take(replace(replace(replace(replace(_seed, ' ', ''), '-', ''), '_', ''), '.', ''), 12)

// RG for test
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: enforcedLocation
}

// Test execution (idempotency: init + idem)
@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, enforcedLocation)}-test-${serviceShort}-${iteration}'
    params: {
      baseName: workloadName

      // Minimal Foundry: project-only (no agent hosts, no auto-deps, no models)
      aiFoundryDefinition: {
        lock: { kind: 'None', name: '' }
        aiProjects: []
        includeAssociatedResources: false
        aiFoundryConfiguration: {
          createCapabilityHosts: false
        }
        aiSearchConfiguration: {}
        storageAccountConfiguration: {}
        cosmosDbConfiguration: {}
        keyVaultConfiguration: {}
        aiModelDeployments: [] // none
      }

      // If your root module exposes this, pass it to avoid PE/PDNS setup in CI
      // (keeps the test small/fast). If not available, omit this line.
      networkIsolation: false

      // Keep if the param is required by the module—even if no VM is created.
      jumpVmAdminPassword: '<StrongP@ssw0rd!>'
    }
  }
]
