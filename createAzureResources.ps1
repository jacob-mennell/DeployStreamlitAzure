# Install and import Azure PowerShell module (if not already installed)
Install-Module -Name Az -Force -AllowClobber
Import-Module Az

# Connect to your Azure account
Connect-AzAccount

# Set your Azure subscription (if you have multiple subscriptions)
Set-AzContext -Subscription "Your_Subscription_Name"

# Define variables
$resourceGroupName = "YourResourceGroup"
$acrName = "YourACRName"
$aspName = "YourAppServicePlanName"
$location = "YourLocation"

# Create the Azure Container Registry
New-AzContainerRegistry -ResourceGroupName $resourceGroupName -Name $acrName -Sku Basic

# Create the smallest App Service Plan (B1) for the Azure Container Registry
New-AzAppServicePlan -ResourceGroupName $resourceGroupName -Name $aspName -Location $location -Tier "Basic" -NumberOfWorkers 1 -WorkerSize "Small"
