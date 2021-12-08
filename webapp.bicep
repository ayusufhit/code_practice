param webAppName string
param location string = resourceGroup().location
param appPlanId string

resource appServiceApp 'Microsoft.Web/sites@2020-06-01' = {
  name: webAppName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    serverFarmId: appPlanId
    httpsOnly: true
  }
}


output webAppId string = appServiceApp.id
