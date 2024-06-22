# Task Manager App

## Description

Task Manager App is a Flutter application designed to help users manage their tasks efficiently. It includes features for user authentication, task CRUD operations, pagination for fetching tasks, robust state management, local storage using Flutter's capabilities, and comprehensive unit tests.

## 🌟 Features Overview

- [x] 🔄 **CI/CD Setup**  
      Integrated CI/CD pipeline using GitHub Actions and Fastlane for automated builds and deployments.

- [x] 🎨 **Flavors**  
      Utilizes flavors to manage different environments such as Development and Production.

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

- [ ] ⚙️ **Settings**  
      Manage user preferences and application settings.

- [ ] 📩 **Notifications**  
      Handle notifications and alerts for users.

## Key Features

### CI/CD Setup

- [x] **GitHub Actions**: Automates continuous integration and deployment pipelines.
- [x] **Fastlane Integration**: Automates build, testing, and release processes for different environments.
- [x] **Flavors**: Configures distinct app variants for various deployment environments.

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

### Settings

- [ ] **Manage user preferences and application settings.**

### Notifications

- [ ] **Handle notifications and alerts for users.**

## Recent Changes

### Initial Project Setup and Configuration

- **Firebase Integration**: Added fingerprint SHA for Firebase authentication.
- **Android Configuration**: Updated minSdkVersion to 23.
- **Assets and Packages**: Configured assets and added necessary packages.
- **Route Extensions and Spacing Widgets**: Implemented custom route extensions and spacing widgets for consistent UI spacing.
- **Native Splash Screen and Launcher Icon**: Set up a native splash screen and custom launcher icon for branding.
- **Text Themes**: Defined custom text themes for consistent typography across the app.
- **ScreenUtil Integration**: Integrated flutter_screenutil for responsive design.
- **Service Locator**: Set up a service locator for dependency injection.
- **App Routes**: Created and configured application routes.
- **Error Handling**: Added comprehensive error handling with platform, format, Firebase, and Dio exceptions.

### App Themes

- **Dark Mode**: Updated AppThemes to enforce a consistent dark mode experience across the app.
  - Custom input decorations for dark mode.
  - Styled buttons, dividers, and color schemes.
  - Integrated modern snackbar and dialog themes for professional look and feel.

### Responsive Sizing

- **AppSizes**: Defined sizes for padding, margins, icons, fonts, buttons, and more.
  - Applied responsive sizing using flutter_screenutil to adapt to various screen sizes.

## Project Structure

```
lib/
  |- core/
  |  |-services/
  |  |  |- api_service.dart
  |  |- themes/
  |  |  |- app_theme.dart
  |  |  |- text_themes.dart
  |  |- validators/
  |  |  |- validation.dart
  |  |- utils/
  |  |  |- logger.dart
  |  |
  |  |- di/
  |  |  |- service_locator.dart
  |  |
  |  |- constants/
  |  |  |- image_strings.dart
  |  |  |- app_sizes.dart
  |  |  |- app_enums.dart
  |  |  |- app_colors.dart
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
