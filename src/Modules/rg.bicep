targetScope = 'subscription'

param resourceGroupName string
param resourceGroupLocation string
param tags object

resource newRG 'Microsoft.Resources/resourceGroups@2025-04-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: tags
}
