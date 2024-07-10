# Task Manager App

Task Manager App is an open-source Flutter application designed to help users manage their tasks efficiently and collaboratively. The app includes robust features such as user authentication, task CRUD operations, real-time updates across devices, calendar integration, and comprehensive state management. It is designed to be free and ad-free, ensuring a seamless user experience without distractions.

## 🌟 Features Overview

- [x] 🔄 **CI/CD Setup**  
      Integrated CI/CD pipeline using GitHub Actions and Fastlane for automated builds and deployments.

- [x] 🎨 **Flavors**  
      Utilizes flavors to manage different environments such as Development and Production.

- [x] 🔑 **User Authentication**  
      Secure user login using Username and Password, and various authentication methods including Firebase and Google.

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

- [x] 📝 **Onboarding**  
      Guide users through the app features with an interactive onboarding experience.

- [ ] 🔗 **Calendar Integration**  
      Link tasks to calendars for better schedule management.

- [ ] 🔄 **Real-Time Updates**  
      Sync tasks in real-time across multiple devices.

- [ ] 📊 **Advanced Analytics**  
      Provide insights and analytics on task completion and productivity.

## Key Features

### CI/CD Setup

- [x] **GitHub Actions**: Automates continuous integration and deployment pipelines.
- [x] **Fastlane Integration**: Automates build, testing, and release processes for different environments.
- [x] **Flavors**: Configures distinct app variants for various deployment environments.

### User Authentication

- [x] User registration using email and password.
- [x] User login using email and password.
- [ ] User logout.
- [ ] User profile management.
- [x] User authentication using Firebase.
- [x] User authentication using Google.
- [ ] User authentication using Apple.
- [ ] User authentication using Microsoft.
- [ ] User authentication using Facebook.

### Task Management

- [ ] CRUD operations for tasks (Create, Read, Update, Delete).
- [ ] Task prioritization (High, Medium, Low).
- [ ] Task categorization.
- [ ] Subtasks management.
- [ ] Task due dates and reminders.
- [ ] Task status tracking (To Do, In Progress, Done).

### Pagination

- [ ] Efficiently fetch tasks in batches using pagination.
- [ ] Scrollable task list with lazy loading.
- [ ] Infinite scrolling.

### State Management

- [ ] State management implemented using Provider/Bloc/Redux.
- [ ] Centralized state management for consistency.
- [ ] Real-time state updates.

### Local Storage

- [ ] Persist tasks locally using Flutter's shared preferences or SQLite.
- [ ] Offline access to tasks.
- [ ] Synchronization with cloud storage.

### Unit Tests

- [ ] Comprehensive unit tests ensuring app functionality and stability.
- [ ] Mocking and stubbing for isolated tests.
- [ ] Continuous integration with test coverage reporting.

### Settings

- [ ] **Manage user preferences and application settings.**
- [ ] Theme customization (Light/Dark mode).
- [ ] Notification preferences.
- [ ] Account management.

### Notifications

- [ ] **Handle notifications and alerts for users.**
- [ ] Push notifications for task reminders.
- [ ] In-app notifications for real-time updates.
- [ ] Email notifications.

### Onboarding

- [x] **Interactive Onboarding**: Guide users through the app features with an engaging and informative onboarding experience.
- [x] **Page View and Dots Indicator**: Smooth transitions and visual indicators for better user orientation during onboarding.

### Calendar Integration

- [ ] **Link to Calendars**: Sync tasks with Google Calendar, Outlook, and other calendar apps for seamless schedule management.
- [ ] **Calendar View**: View tasks in a calendar format.

### Real-Time Updates

- [ ] **Multi-Device Sync**: Sync tasks in real-time across multiple devices.
- [ ] **Collaborative Tasks**: Real-time collaboration on tasks with multiple users.

### Advanced Analytics

- [ ] **Productivity Insights**: Detailed analytics on task completion and productivity trends.
- [ ] **Reports**: Generate reports on task performance over time.

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

### Onboarding Feature

- **App Images**: Added SVG images for onboarding.
- **App Strings**: Defined consistent strings for the app.
- **Onboarding View**: Implemented onboarding view with page view for structured user guidance.
- **Onboarding Dots Indicator**: Created an onboarding dots indicator for visual pagination during onboarding.

## Project Structure

```
lib/
  |- core/
  |  |- services/
  |  |  |- api_service.dart
  |
  |- themes/
  |  |- app_text_themes.dart
  |
  |- validators/
  |  |- validation.dart
  |
  |- utils/
  |  |- logger.dart
  |
  |- di/
  |  |- service_locator.dart
  |
  |- constants/
  |  |- app_images.dart
  |  |- app_strings.dart
  |  |- app_constants.dart
  |  |- app_enums.dart
  |  |- app_colors.dart
  |  |- api_constants.dart
  |
  |- features/
  |  |- authentication/
  |  |  |- presentation/
  |  |  |  |- views/
  |  |  |  |- view_models/
  |  |  |  |- widgets/
  |  |  |  |- manager/
  |  |  |  |  |- cubits/
  |  |  |- domain/
  |  |  |  |- use_cases/
  |  |  |  |- entities/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |  |- task_management/
  |  |  |- presentation/
  |  |  |  |- views/
  |  |  |  |- view_models/
  |  |  |  |- widgets/
  |  |  |  |- manager/
  |  |  |  |  |- cubits/
  |  |  |- domain/
  |  |  |  |- use_cases/
  |  |  |  |- entities/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |  |- settings/
  |  |  |- presentation/
  |  |  |  |- views/
  |  |  |  |- view_models/
  |  |  |  |- widgets/
  |  |  |  |- manager/
  |  |  |  |  |- cubits/
  |  |  |- domain/
  |  |  |  |- use_cases/
  |  |  |  |- entities/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |  |- notifications/
  |  |  |- presentation/
  |  |  |  |- views/
  |  |  |  |- view_models/
  |  |  |  |- widgets/
  |  |  |  |- manager/
  |  |  |  |  |- cubits/
  |  |  |- domain/
  |  |  |  |- use_cases/
  |  |  |  |- entities/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |  |- onboarding/
  |  |  |- presentation/
  |  |  |  |- views/
  |  |  |  |- view_models/
  |  |  |  |- widgets/
  |  |  |  |- manager/
  |  |  |  |  |- cubits/
  |  |  |- domain/
  |  |  |  |- use_cases/
  |  |  |  |- entities/
  |  |  |- data/
  |  |  |  |- repos/
  |  |  |  |- models/
  |
  |- task_manager

_app.dart
  |- main_production.dart
  |- main_development.dart
```

## Contributing

We welcome contributions to the Task Manager App! If you would like to contribute, please follow these guidelines:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make your changes and commit them (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

If you have any questions or suggestions, feel free to open an issue or contact us directly.

Happy coding!
