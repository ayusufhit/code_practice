param SPName string = 'nameOfPlan1' 
@allowed([
  'windows'
  'linux'
])
param SPSystemType string = 'windows'

param SPSku string = 'B1' 

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: SPName
  location: resourceGroup().location
  kind: SPSystemType
  sku: { 
    name: SPSku
  }
}

output planId string = appServicePlan.id