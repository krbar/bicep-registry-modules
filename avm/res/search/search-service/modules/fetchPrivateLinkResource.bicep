@description('Required. The name of the Shared Private Access resource.')
param name string

resource sharedPrivateLinkResource 'Microsoft.Search/searchServices/sharedPrivateLinkResources@2023-11-01' existing = {
  name: name
}

@description('The name of the shared private link resource.')
output name string = sharedPrivateLinkResource.name
