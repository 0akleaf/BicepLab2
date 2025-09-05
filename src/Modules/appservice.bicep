targetScope = 'resourceGroup'

param appServiceName string
param location string
param skuName string
param tags object
param httpsOnly bool = true

resource appServicePlan 'Microsoft.Web/serverfarms@2024-11-01' = {
  name: 'plan-${appServiceName}'
  location: location
  sku: {
    name: skuName
  }
  tags: tags
}

resource webApp 'Microsoft.Web/sites@2024-11-01' = {
  name: 'app-${appServiceName}'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: httpsOnly
  }
  tags: tags
}

output webAppUrl string = 'https://${webApp.properties.defaultHostName}/'
