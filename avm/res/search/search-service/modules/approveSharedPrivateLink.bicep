// approve-private-endpoint.bicep
param searchServiceName string
param privateLinkResourceName string

resource searchService 'Microsoft.Search/searchServices@2023-11-01' existing = {
  name: searchServiceName
}

resource privateEndpointConnection 'Microsoft.Search/searchServices/sharedPrivateLinkResources@2023-11-01' = {
  parent: searchService
  name: privateLinkResourceName
  properties: {
    status: 'Approved'
  }
}
