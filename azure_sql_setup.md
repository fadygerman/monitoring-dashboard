# Setting Up Azure SQL Database

For detailed deployment and running instructions, please refer to the `deployment_instructions.md` file.

## Using Azure SQL Database
1. Go to the Azure portal.
2. Create a new Azure SQL Database.
3. Configure the database settings:
   - **Server Name**: `pc-dashboard-server`
   - **Location**: `(Europe) West Europe`
   - **Authentication Method**: Use both SQL and Microsoft Entra authentication
   - **Set Microsoft Entra Admin**: Select an existing Microsoft Entra user, group, or application as the admin.

## Storing Environment Variables and Secrets
You can store sensitive values in environment variables. In Azure, you can set them via the Azure App Service configuration. In Django, reference these variables in `settings.py` using `os.environ.get('VARIABLE_NAME')`.

For example:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlserver',
        'NAME': 'mydatabase',
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': 'pc-dashboard-server.database.windows.net',
        'PORT': '1433',
    }
}
```

## Managing Environment Variables and Secrets in Azure

### Setting Environment Variables
To store sensitive information like database passwords, set environment variables in the Azure App Service configuration.

### Updating Django Settings
In `settings.py`, reference these environment variables:
```python
import os

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlserver',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': os.environ.get('DB_PORT'),
    }
}
```
