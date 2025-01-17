# Setting Up PostgreSQL on Azure

For detailed deployment and running instructions, please refer to the `deployment_instructions.md` file.

## Using Azure PostgreSQL
1. Go to the Azure portal.
2. Create a new PostgreSQL server.
3. Configure the server settings (e.g., server name, admin username, password).
4. Create a new database on the server.

## Storing Environment Variables and Secrets
You can store sensitive values in environment variables. In Azure, you can set them via the Azure App Service configuration. In Django, reference these variables in `settings.py` using `os.environ.get('VARIABLE_NAME')`.

For example:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'mydatabase',
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': 'postgresql-service',
        'PORT': '5432',
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
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': os.environ.get('DB_NAME'),
        'USER': os.environ.get('DB_USER'),
        'PASSWORD': os.environ.get('DB_PASSWORD'),
        'HOST': os.environ.get('DB_HOST'),
        'PORT': os.environ.get('DB_PORT'),
    }
}
```