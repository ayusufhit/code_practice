param skuName string = 'B1'
param rgName string
param appName string 
var appServicePlanName = toLower('asp-${appName}')
var webSiteName = toLower('wapp-${appName}')

targetScope = 'subscription'

var resourceGroupName = rgName



//Create Resource Group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
location: deployment().location
name: resourceGroupName
}

//Deploy AppPlan
module appPlandeploy 'AppPlan.bicep' = {
  scope: rg 
  name: 'appPlanShared'
  params: {
      SPName: appServicePlanName
      SPSku: skuName
      SPSystemType: 'windows'
  }
}

//Deploy WebApp
module WebAppDeploy 'webapp.bicep' = {
  scope: rg 
  name: 'WebApp'
  params: {
    webAppName : webSiteName
     appPlanId: appPlandeploy.outputs.planId
  }
}

