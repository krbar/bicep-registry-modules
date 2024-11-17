metadata name = 'Machine Learning Services Registries'
metadata description = 'This module deploys a Machine Learning Services Registry.'
metadata owner = 'Azure/module-maintainers'

@description('Required. Name of the machine learning registry.')
param name string

@description('Optional. Location for all Resources.')
param location string = resourceGroup().location

@description('Optional. Enable/Disable usage telemetry for module.')
param enableTelemetry bool = true

@description('Optional. The discovery URL for the Registry')
param discoveryUrl string?

@description('Optional. The intellectual property publisher for the Registry')
param intellectualPropertyPublisher string?

@description('Optional. The MLFlow Registry URI')
param mlFlowRegistryUri string?

@description('Optional. The ResourceId of the managed Resource Group if the registry has system created resources.')
param managedResourceGroupResourceId string?

@allowed([
  'Disabled'
  'Enabled'
])
@description('Optional. The public network access for the Registry')
param publicNetworkAccess string = 'Disabled'

// ============== //
// Resources      //
// ============== //

#disable-next-line no-deployments-resources
resource avmTelemetry 'Microsoft.Resources/deployments@2024-03-01' = if (enableTelemetry) {
  name: '46d3xbcp.[[REPLACE WITH TELEMETRY IDENTIFIER]].${replace('-..--..-', '.', '-')}.${substring(uniqueString(deployment().name, location), 0, 4)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
      outputs: {
        telemetry: {
          type: 'String'
          value: 'For more information, see https://aka.ms/avm/TelemetryInfo'
        }
      }
    }
  }
}

resource registry 'Microsoft.MachineLearningServices/registries@2024-04-01' = {
  name: name
  location: location
  properties: {
    discoveryUrl: discoveryUrl
    intellectualPropertyPublisher: intellectualPropertyPublisher
    managedResourceGroup: {
      resourceId: managedResourceGroupResourceId
    }
    mlFlowRegistryUri: mlFlowRegistryUri
    publicNetworkAccess: publicNetworkAccess
  }
}

// ============ //
// Outputs      //
// ============ //

// Add your outputs here

// @description('The resource ID of the resource.')
// output resourceId string = <Resource>.id

// @description('The name of the resource.')
// output name string = <Resource>.name

// @description('The location the resource was deployed into.')
// output location string = <Resource>.location

// ================ //
// Definitions      //
// ================ //

@export()
@description('Details of each region the registry is in.')
type registryRegionDetailsType = {
  @description('Optional. The location where the registry exists.')
  location: string
  @description('Optional. List of ACR accounts.')
  acrAccounts: {
    @description('Optional. Details of system created ACR account to be used for the Registry.')
    systemCreatedAcrAccount: {
      @description('Optional. Name of the ACR account.')
      acrAccountName: string
      @description('Optional. SKU of the ACR account.')
      acrAccountSku: string
      @description('Optional. The resource ID of the ACR account.')
      armResourceId: {
        @description('Optional. The resource ID of the ACR account.')
        resourceId: string
      }
    }
    @description('Optional. The resource ID of the ACR account.')
    resourceId: string
  }
}
