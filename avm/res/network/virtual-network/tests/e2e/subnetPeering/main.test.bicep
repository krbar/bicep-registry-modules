targetScope = 'subscription'

metadata name = 'Deploying subnet-level peering'
metadata description = 'This instance deploys the module with subnet-level peering, peering only specific subnets between two virtual networks.'

// ========== //
// Parameters //
// ========== //

@description('Optional. The name of the resource group to deploy for testing purposes.')
@maxLength(90)
param resourceGroupName string = 'dep-${namePrefix}-network.virtualnetworks-${serviceShort}-rg'

@description('Optional. The location to deploy resources to.')
param resourceLocation string = deployment().location

@description('Optional. A short identifier for the kind of deployment. Should be kept short to not run into resource-name length-constraints.')
param serviceShort string = 'nvnsubpr'

@description('Optional. A token to inject into the name of each resource.')
param namePrefix string = '#_namePrefix_#'

// ============ //
// Dependencies //
// ============ //

// General resources
// =================
resource resourceGroup 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: resourceLocation
}

module nestedDependencies 'dependencies.bicep' = {
  scope: resourceGroup
  name: '${uniqueString(deployment().name, resourceLocation)}-nestedDependencies'
  params: {
    location: resourceLocation
    virtualNetworkName: 'dep-${namePrefix}-vnet-${serviceShort}'
  }
}

// ============== //
// Test Execution //
// ============== //

@batchSize(1)
module testDeployment '../../../main.bicep' = [
  for iteration in ['init', 'idem']: {
    scope: resourceGroup
    name: '${uniqueString(deployment().name, resourceLocation)}-test-${serviceShort}-${iteration}'
    params: {
      name: '${namePrefix}${serviceShort}001'
      location: resourceLocation
      addressPrefixes: [
        '10.1.0.0/16'
      ]
      subnets: [
        {
          addressPrefix: cidrSubnet('10.1.0.0/16', 24, 0)
          name: 'localSubnet1'
        }
        {
          addressPrefix: cidrSubnet('10.1.0.0/16', 24, 1)
          name: 'localSubnet2'
        }
      ]
      peerings: [
        {
          allowForwardedTraffic: true
          allowGatewayTransit: false
          allowVirtualNetworkAccess: true
          peerCompleteVnets: false
          localSubnetNames: [
            'localSubnet1'
          ]
          remoteSubnetNames: [
            'remoteSubnet1'
          ]
          remotePeeringEnabled: true
          remotePeeringAllowForwardedTraffic: true
          remotePeeringAllowVirtualNetworkAccess: true
          remotePeeringPeerCompleteVnets: false
          remotePeeringLocalSubnetNames: [
            'remoteSubnet1'
          ]
          remotePeeringRemoteSubnetNames: [
            'localSubnet1'
          ]
          remoteVirtualNetworkResourceId: nestedDependencies.outputs.virtualNetworkResourceId
          useRemoteGateways: false
        }
      ]
      tags: {
        'hidden-title': 'This is visible in the resource name'
        Environment: 'Non-Prod'
        Role: 'DeploymentValidation'
      }
    }
  }
]
