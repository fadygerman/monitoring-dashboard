# Deployment and Running Instructions

## Step 1: Set Up Azure SQL Database

### Create an Azure SQL Database
1. Go to the Azure portal.
2. Create a new Azure SQL Database.
3. Configure the database settings (e.g., database name, admin username, password).

## Step 2: Create Secrets and Configurations

### Storing Environment Variables
Store sensitive values in environment variables. In Azure, you can set them via the Azure App Service configuration.

### Configure Django
Update `settings.py` to use environment variables:
```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    }
}
```

## Step 3: Deploy the Django Application

### Create an Azure Web App for Containers
1. Go to the Azure portal.
2. Create a new Web App.
3. Select the **Container** option for publishing.
4. Configure the Web App settings (e.g., app name, runtime stack).

### Deploy the Django Application
1. Use the Azure CLI or the Azure portal to deploy your Docker container for the Django application.
2. Set the environment variables in the Web App configuration.

## Step 4: Expose the Service
The Azure Web App will automatically expose your application. You can find the URL in the Web App overview.

## Step 5: Configure Django Settings
In `settings.py`, reference the environment variables:
```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'sql_server.pyodbc',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': '',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    }
}
```

## Step 6: Run Migrations
Run Django migrations to set up your database schema:
```sh
python manage.py migrate
```

## Step 7: Deploy the Frontend

### Create an Azure Static Web App
1. Go to the Azure portal.
2. Create a new Static Web App.
3. Configure the Static Web App settings (e.g., app name, build settings).

### Deploy the React Application
1. Use the Azure CLI or the Azure portal to deploy your React application.

## Step 8: Access the Application
Access your application using the URL provided by the Azure Web App and Static Web App.

## Benefits
- **Persistence** with Azure SQL Database
- **Scalability** with Azure Web App and Static Web Apps
- **Management** via the Azure portal and CLI

## Optional Advanced Setup

### 9. Integrate with Azure Key Vault
1. Create an Azure Key Vault in the Azure portal.
2. Store your sensitive settings (e.g., DB_USER, DB_PASSWORD) as secrets in Key Vault.
3. In your Azure Web App configuration, enable Managed Identity and grant it access to your Key Vault.
4. Update `settings.py` to retrieve secrets from Key Vault instead of environment variables if needed.

### 10. Create an Azure Pipeline for CI/CD
1. Use Azure DevOps or GitHub Actions with Azure Pipelines to automate testing and deployment.
2. Set up your pipeline to:
   - Build your Django/React apps
   - Run tests
   - Deploy to Azure Web App (backend) and Azure Static Web Apps (frontend)

### Cost Considerations

1. **Django**: Django itself is free and open-source. The cost associated with using Django comes from the infrastructure required to run your Django application, such as virtual machines, App Services, or container services on Azure.

2. **Azure SQL Database**: Azure SQL Database is a managed service, and its cost depends on the pricing tier you choose. It provides features like high availability, automated backups, and scaling, which can save you time and effort compared to managing your own database server.

### Summary

- **Django**: Required for building and managing your web application.
- **Azure SQL Database**: Provides a managed database backend for your application.

Using both Django and Azure SQL Database together allows you to leverage the strengths of each: Django for building and managing your web application, and Azure SQL Database for a scalable and managed database solution.

### Updated Deployment Instructions

Ensure the deployment instructions reflect the use of both Django and Azure SQL Database:
