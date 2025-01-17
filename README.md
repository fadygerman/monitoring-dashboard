# PC Monitoring Dashboard

This project is a monitoring system designed to track the status of PCs in real-time. It consists of a frontend built with React and a backend powered by Django. Users can view the status of each PC and update its availability through a user-friendly dashboard.

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Getting Started](#getting-started)
- [Deployment](#deployment)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Project Structure

The project is organized into two main directories: `backend` and `frontend`.

### Backend

- **manage.py**: Command-line utility for administrative tasks in the Django project.
- **db.sqlite3**: SQLite database that stores the status of each PC.
- **remoteteammonitor/**: Contains the main Django project files.
  - **asgi.py**: ASGI configuration for the Django project.
  - **settings.py**: Settings and configuration for the Django project.
  - **urls.py**: URL routing for the Django project.
  - **wsgi.py**: WSGI configuration for the Django project.
- **monitor/**: Contains the monitoring app files.
  - **models.py**: Defines the PC model with fields for name, status, group, currentUser, and since.
  - **views.py**: Contains views for rendering the dashboard and handling status updates.
  - **serializers.py**: Serializes the PC model for API responses.
  - **consumers.py**: Handles WebSocket connections for real-time updates.
  - **urls.py**: URL routing for the monitor app.
  - **templates/monitor/dashboard.html**: HTML template for the dashboard.
  - **admin.py**: Admin configuration for the Django admin interface.
  - **apps.py**: App configuration for the monitor app.
  - **routing.py**: WebSocket routing for the monitor app.
  - **tests.py**: Unit tests for the monitor app.

### Frontend

- **.gitignore**: Specifies files and directories to be ignored by Git.
- **package.json**: Contains metadata about the project, including dependencies and scripts for building and running the React app.
- **public/**: Contains static files for the React app.
  - **index.html**: Main HTML file serving as the entry point for the application.
  - **manifest.json**: Provides metadata for the web application.
  - **robots.txt**: Controls how search engines index the site.
- **src/**: Contains the source code for the React app.
  - **App.js**: Main component rendering the dashboard and integrating other components.
  - **components/**: Contains individual components for the dashboard and PC status.
  - **index.js**: Entry point for the React app.
  - **App.css**: CSS styles for the App component.
  - **App.test.js**: Tests for the App component.
  - **setupTests.js**: Setup for testing library.
  - **reportWebVitals.js**: Web vitals reporting.

## Features

- **User Interface**: A dashboard displaying the status of all PCs.
- **User Actions**: Users can mark a PC as "in use" or "available" by clicking on its name.
- **Real-Time Updates**: Status updates are reflected in real-time for all users.
- **Authentication**: Optional user authentication to track who is using which PC.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository.
2. Navigate to the `backend` directory and set up the Django environment.
3. Run the migrations to set up the database:
   ```sh
   python manage.py migrate
   ```
4. Start the Django server:
   ```sh
   python manage.py runserver
   ```
5. Navigate to the `frontend` directory and install the necessary dependencies:
   ```sh
   npm install
   ```
6. Start the React development server:
   ```sh
   npm start
   ```

## Deployment

### Docker

To deploy the application using Docker, follow these steps:

1. Build and run the containers:
   ```sh
   docker-compose up --build -d
   ```
2. Access the application:
   - Frontend: http://localhost:3000
   - Backend: http://localhost:8000

### Azure

Refer to the `deployment_instructions.md` file for detailed instructions on deploying the application to Azure.

## Usage

Once the application is set up, you can use the dashboard to monitor and update the status of PCs. The dashboard provides real-time updates and allows users to change the status of PCs by clicking on them.

## Contributing

If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bugfix:
   ```sh
   git checkout -b feature-name
   ```
3. Make your changes and commit them:
   ```sh
   git commit -m "Description of your changes"
   ```
4. Push your changes to your fork:
   ```sh
   git push origin feature-name
   ```
5. Create a pull request to the main repository.

## License

This project is licensed under the MIT License.# monitoring-dashboard
# monitoring-dashboard
