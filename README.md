# Task Manager App


## Description

Task Manager App is a Flutter application designed to help users manage their tasks efficiently. It includes features for user authentication, task CRUD operations, pagination for fetching tasks, robust state management, local storage using Flutter's capabilities, and comprehensive unit tests.

## 🌟 Features Overview

- [ ] 🔑 **User Authentication**  
      Secure user login using Username and Password.

- [ ] ✏️ **Task Management**  
      Create, read, update, and delete tasks seamlessly.

- [ ] 🔄 **Pagination**  
      Efficiently fetch tasks using pagination.

- [ ] 🔄 **State Management**  
      Implemented using Provider/Bloc/Redux for optimal performance.

- [ ] 💾 **Local Storage**  
      Persist tasks locally using shared preferences or SQLite.

- [ ] 🧪 **Unit Tests**  
      Comprehensive tests covering critical functionalities.

- [x] 🔄 **CI/CD Setup**  
      Integrated CI/CD pipeline using GitHub Actions and Fastlane for automated builds and deployments.

- [x] 🎨 **Flavors**  
      Utilizes flavors to manage different environments such as Development and Production.

## Key Features

### User Authentication

- [ ] Secure user login with Username and Password.

### Task Management

- [ ] CRUD operations for tasks (Create, Read, Update, Delete).

### Pagination

- [ ] Efficiently fetch tasks in batches using pagination.

### State Management

- [ ] State management implemented using Provider/Bloc/Redux.

### Local Storage

- [ ] Persist tasks locally using Flutter's shared preferences or SQLite.

### Unit Tests

- [ ] Comprehensive unit tests ensuring app functionality and stability.

### CI/CD Setup

- [x] **GitHub Actions**: Automates continuous integration and deployment pipelines.
- [x] **Fastlane Integration**: Automates build, testing, and release processes for different environments.
- [x] **Flavors**: Configures distinct app variants for various deployment environments.

## Project Structure

```
lib/
  |- core/
  |  |- themes/
  |  |  |- app_theme.dart
  |  |  |- theme_colors.dart
  |  |  |- theme_typography.dart
  |  |
  |  |- utils/
  |  |  |- services/
  |  |  |  |- api_service.dart
  |  |  |  |- analytics_service.dart
  |  |  |- date_time_utils.dart
  |  |  |- logger.dart
  |  |
  |  |- di/
  |  |  |- service_locator.dart
  |  |
  |  |- constants/
  |  |  |- app_constants.dart
  |  |  |- api_constants.dart
  |
  |- features/
  |  |- authentication/
  |  |  |- views/
  |  |  |- view_models/
  |  |  |- widgets/
  |  |  |- logic/
  |  |  |  |- cubits/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |  |
  |  |- task_management/
  |  |  |- views/
  |  |  |- view_models/
  |  |  |- widgets/
  |  |  |- logic/
  |  |  |  |- cubits/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |  |
  |  |- settings/
  |  |  |- views/
  |  |  |- view_models/
  |  |  |- widgets/
  |  |  |- logic/
  |  |  |  |- cubits/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |  |
  |  |- notifications/
  |  |  |- views/
  |  |  |- view_models/
  |  |  |- widgets/
  |  |  |- logic/
  |  |  |  |- cubits/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |- main_production.dart
  |- main_development.dart

```

## Evaluation Criteria

Candidates will be evaluated based on:

- Adherence to Flutter best practices and coding standards.
- Effective implementation of state management.
- Performance optimization and smooth UI interactions.
- Proper handling of local storage for data persistence.
- Coverage and quality of unit tests.

## Submission

Candidates are required to submit their completed Flutter project within 3 days on a version control platform like GitHub. Include clear instructions for building and running the app. Additionally, provide a brief README outlining design decisions, challenges faced, and any additional features implemented.
