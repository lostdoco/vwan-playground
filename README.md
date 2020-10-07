# Azure Virtual WAN Playground
Welcome to the Azure Virtual WAN Playground repository! Your one-stop shop for an awesome Azure Virtual WAN lab environment.

## What is Azure Virtual WAN Playground?
This repo is dedicated for all poor souls out there who want to play around with Azure Virtual WAN but don't have unlimited Azure Credit in their subscriptions. I've put together a template that deploys Azure Virtual WAN and all resources needed to play around with the service and test everything from VPN, Routing, Secured Virtual Hub, Virtual Network connections and more. The goal is to make it easy to spin up an environment when you need to test a feature for a short period of time and then remove it all when finished.

## How it's built
The Azure Virtual WAN Playground is built using 💪Bicep language which makes it so much easier to work with and read compared to ARM Templates. Azure Virtual WAN with all it's dependencies between the hub and the connected services like VPN Gateway, Firewall (Secured Virtual WAN), VPN Site makes it hard to follow in pure ARM template. If you haven't tested Bicep yet check out the [Bicep repository](https://github.com/Azure/bicep) for all info needed, I guarantee you're going to love it!

## Deployment
Deploy the solution using the PowerShell `Az` deployment cmdlets or `az cli` deployment commands and the compiled `main.json` template.

## Topology
The Azure Virtual WAN Playground deploys the following topology:

- Azure Virtual WAN
  - Virtual WAN Hub (Secured Virtual Hub)
  - Firewall Policy
  - Azure Firewall
  - Virtual Network Connection (Spoke VNet)
  - VPN Gateway
  - VPN Site (On-Prem VNet)
- Spoke VNet
  - Azure Bastion Service
  - Virtual Machine
- On-Prem VNet
  - Azure Bastion Service
  - Virtual Machine
  - VPN Gateway
    - Connection (On-Prem to WAN Hub)
      - Local Network Gateway
- Log Analytics Workspace (Firewall Diagnostics)  
 
<img src="https://github.com/StefanIvemo/vwan-playground/blob/diag-settings/media/vwan-playground-topology.png?raw=true">

## Improvements
Azure Virtual WAN Playground will evolve over time with new features added regularly. The following improvements are planned:

- When Bicep language supports the `condition` property it will be possible to decide which features to deployed using parameters.
- A cleanup script will be added that removes all resources in the correct order for quick removal of the solution.
- User VPN Gateway and User VPN Configuration.
- Additional Spoke VNet (when Bicep language supports `copy`)
- Azure Firewall default rule set added to Firewall Policy.
- Azure Firewall Workbook added to Log Analytics Workspace.
- Azure Sentinel.

Other improvements can be requested by creating a new issue.

## Contributing
If you find this project interested and want to contribute, please feel free to submit Pull Requests with suggested improvements.
