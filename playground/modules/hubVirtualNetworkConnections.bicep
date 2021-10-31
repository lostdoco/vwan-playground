param hubName string
param connectionName string
param vnetId string
param associatedRouteTableId string
param propagatedRouteTableIds array = []

var routeTableIds = [for id in propagatedRouteTableIds:{
id: id
}]

resource vHub 'Microsoft.Network/virtualHubs@2021-03-01' existing = {
  name: hubName
}

resource connection 'Microsoft.Network/virtualHubs/hubVirtualNetworkConnections@2021-03-01' = {
  name: connectionName
  parent: vHub
  properties: {
    remoteVirtualNetwork: {
      id: vnetId
    }
    allowHubToRemoteVnetTransit: true
    allowRemoteVnetToUseHubVnetGateways: true
    enableInternetSecurity: true
    routingConfiguration: {
      associatedRouteTable: {
        id: associatedRouteTableId
      }
      propagatedRouteTables: {
        ids: propagatedRouteTableIds == [] ? json('null') : routeTableIds
      }
    }
  }
}

// Hack to give the default route tables time to update. Creates 20 empty deployments.
@batchSize(1)
module wait 'wait.bicep' = [for i in range(1,30): {
  name: 'WaitingOnRoutes${i}'
  dependsOn: [
    connection
  ]
}]
