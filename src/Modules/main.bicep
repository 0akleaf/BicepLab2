targetScope = 'resourceGroup'
param storageSkuName string
param storageKind string
param tags object
param appServiceName string
param location string
param appServiceSkuName string
param httpsOnly bool = true

var environmentName = tags.environment

module storageModules 'storage.bicep' = {
  params: {
    storageName: 'stg${uniqueString(resourceGroup().id)}${environmentName}'
    storageLocation: location
    storageSkuName: storageSkuName
    kind: storageKind
    tags: tags
  }
}

module appservice 'appservice.bicep' = {
  params: {
    appServiceName: '${appServiceName}-${environmentName}'
    httpsOnly: httpsOnly
    location: location
    skuName: appServiceSkuName
    tags: tags
  }
}

output webAppUrl string = appservice.outputs.webAppUrl
