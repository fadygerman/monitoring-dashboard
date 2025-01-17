# Deployment and Running Instructions

## Step 1: Set Up PostgreSQL on OpenShift

### Using OpenShift Templates
Run:
```sh
oc new-app postgresql-persistent \
  -p POSTGRESQL_USER=user \
  -p POSTGRESQL_PASSWORD=password \
  -p POSTGRESQL_DATABASE=mydatabase
```

### Using OpenShift Operators
Deploy the PostgreSQL Database Operator to manage databases, including automated backups, scaling, and updates.

## Step 2: Create Secrets and ConfigMaps

### Creating a Secret
```sh
oc create secret generic db-secret \
  --from-literal=DB_USER=user \
  --from-literal=DB_PASSWORD=password
```

### Creating a ConfigMap
```sh
oc create configmap db-config \
  --from-literal=DB_NAME=mydatabase \
  --from-literal=DB_HOST=postgresql-service \
  --from-literal=DB_PORT=5432
```

## Step 3: Deploy the Django Application

### Create a DeploymentConfig
Create a `deploymentconfig.yaml` file:
```yaml
apiVersion: apps.openshift.io/v1
kind: DeploymentConfig
metadata:
  name: pc-monitoring-dashboard
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: pc-monitoring-dashboard
    spec:
      containers:
      - name: pc-monitoring-dashboard
        image: your-django-app-image
        ports:
        - containerPort: 8000
        env:
        - name: DB_USER
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: DB_USER
        - name: DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: DB_PASSWORD
        - name: DB_NAME
          valueFrom:
            configMapKeyRef:
              name: db-config
              key: DB_NAME
        - name: DB_HOST
          valueFrom:
            configMapKeyRef:
              name: db-config
              key: DB_HOST
        - name: DB_PORT
          valueFrom:
            configMapKeyRef:
              name: db-config
              key: DB_PORT
```

Apply the DeploymentConfig:
```sh
oc apply -f deploymentconfig.yaml
```

## Step 4: Expose the Service
Expose the Django application service:
```sh
oc expose dc pc-monitoring-dashboard --port=8000 --target-port=8000
oc expose svc pc-monitoring-dashboard
```

## Step 5: Configure Django Settings
In `settings.py`, reference the environment variables:
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

## Step 6: Run Migrations
Run Django migrations to set up your database schema:
```sh
python manage.py migrate
```

## Step 7: Deploy the Frontend
If you have a separate frontend application, deploy it similarly by creating a DeploymentConfig and exposing the service.

## Step 8: Access the Application
Access your application using the route created by OpenShift. You can find the route URL by running:
```sh
oc get routes
```

## Benefits
- **Persistence** with persistent volumes
- **Scalability** as needed
- **Management** via built-in tools and operators
