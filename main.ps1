#authenticate to Azure
Connect-AzAccount

#The name of the target Resource Group
$resourceGroupName = 'MSFT'

#The name of the Automation Account
$automationAccountName = 'desiredconfiguration'

#The name of the target VM
$virtualMachineName = 'proxyserver'

####### DEBES CREAR EL SCRIPT QUE TE DEJO EN ESTE MISMO REPO EN UNA RUTA DE TU PC Y MAPEARLA EN LA SIGUIENTE LINEA

#Import DSC script file into Azure DSC
Import-AzAutomationDscConfiguration -SourcePath "apache2.ps1" -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName -Published

#Force Azure DSC to compile DSC Configuration
Start-AzAutomationDscCompilationJob -ConfigurationName 'apache2' -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName

#Obtain metadata for DSC configuration and ensure RollupStatus is Good
Get-AzAutomationDscNodeConfiguration -ResourceGroupName $resourceGroupName -AutomationAccountName $automationAccountName
