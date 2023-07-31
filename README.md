
# Project Name

[![Streamlit](https://img.shields.io/badge/built%20with-Streamlit-09a5d6.svg)](https://www.streamlit.io/)

Description of your project.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Deployment](#deployment)
  - [Azure Resources](#azure-resources)
  - [Docker](#docker)
  - [Streamlit App on Azure](#streamlit-app-on-azure)
- [Continuous Integration and Deployment (CICD)](#continuous-integration-and-deployment-cicd)

## Introduction

The purpose of this project is to create a dummy project set up, with guidance and steps, to enable the delopyment of Streamlit Apps on Microsoft Azure.

## Prerequisites

Installtion of Docker, VS Code Azure Extension (optional), VS Code Docker Extension (optional), Python

## Deployment

To deploy your Streamlit app on Azure, use Docker to containerize the app, Azure Container Registry (ACR) to store the Docker image, and an App Service Plan to host and run the app on Azure.

## CI/CD
To provide automated deployment of the Streamlit app, a Continuous Integration and Deployment (CICD) pipeline can be set up with branch policies. This pipeline will leverage Azure DevOps to automatically build and push a new container image to the Azure Container Registry (ACR) whenever there's a new commit to the main branch. See docker-compose.yml

### Azure Resources

#### Creating Azure Resources

Before deploying the app, the necessery Azure resources need to created This can be done using either Azure CLI, PowerShell, Azure Portal UI or Visual Studio Code (VS Code) extensions. I opted for VS Code extension route. 

##### Using PowerShell with Azure UI

You can use Azure PowerShell to create resources interactively with the Azure UI. 

##### Using Visual Studio Code (VS Code) Extensions

Alternatively, you can use VS Code extensions like "Azure Account" and "Azure App Service" to create resources directly from your editor.

### Docker

#### Building and Pushing the Docker Image

Now that we have our Azure resources in place, let's build the Docker image for your Streamlit app and push it to the Azure Container Registry (ACR).

1. Make sure you have Docker installed on your local machine.

2. In the root directory of your Streamlit app project, create a Dockerfile. This file will define the environment and dependencies required to run your app.

3. Build the Docker image - this can be done via the Docker Extension, once installed, just right click on the Dockerfile and click 'Build Image'. This can be done locally and sent to Azure later or built directly within the Azure Container Registry. Alternatively, the command line can be used to build the docker image and push to Azure...

```bash
docker build -t your-acr-name.azurecr.io/your-app-name:latest .
```

4. Login to Azure Container Registry:
```bash
az acr login --name YourACRName
```

5. Push the Docker image to Azure Container Registry:
```bash
docker push your-acr-name.azurecr.io/your-app-name:latest
```

### Streamlit App on Azure

#### Deploying the App to App Service

With the Docker image pushed to the Container Registry, the Streamlit App can be deployed to an Azure App Service using the previously created App Service Plan. 

#### Deploy via VC code

1. Ensure the Docker extension is installed on VS Code

2. Click on "Registries", then 'Connect Registry, then 'Azure'
   
4. Once connected you should see the Azure Container Registry created earlier.

5. You can right click on the containerised image within the new registry and click 'Deploy Image to Azure App Service' to deploy the image to the new application

6. Access your deployed Streamlit app using the App Service URL.

#### Deploy via Azure Portal UI

1. Go to the Azure Portal and navigate to your App Service.

2. Click on "Deployment Centre" to set up continuous deployment using your Git repository or other version control systems for automatic deployment whenever there's a new commit to the main branch.

3. In the "Configuration" tab of your App Service, set the "Docker Container" as the deployment method and provide the URL of your Docker image from the Azure Container Registry.

4. Save the configuration, and Azure will automatically deploy your Streamlit app from the Docker image.

5. Access your deployed Streamlit app using the App Service URL.


