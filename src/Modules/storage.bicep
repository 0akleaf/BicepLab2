param storageName string
param storageLocation string
param storageSkuName string
param kind string
param tags object

resource storageaccounts 'Microsoft.Storage/storageAccounts@2025-01-01' = {
  name: storageName
  location: storageLocation
  kind: kind
  sku: {
    name: storageSkuName
  }

  tags: tags
}

output storageAccountName string = storageaccounts.name
