
# Overview
This is a simple Flutter project designed to implement basic login and registration functionalities. The project emphasizes clean code, scalability, and maintainability by adhering to SOLID principles and employing modern design patterns and state management techniques.







## Features
- Login and Registration

- Email and password authentication.

- Login with social platforms: Google and Facebook.

- State Management

- Powered by BLoC (Business Logic Component) for predictable state management.

- Dependency Injection

- Implemented using GetIt for loose coupling.

- Network Requests

- Managed with Dio, a powerful HTTP client for Dart.

- Design Patterns

- Strategy Pattern: Supports multiple login strategies (Email, Google, Facebook).

-  Singleton Pattern: Ensures a single instance of critical services.
## Principles and Best Practices
 SOLID Principles:

- Single Responsibility Principle: Each class has a single responsibility.

- Open/Closed Principle: The system is open for extension but closed for modification.

- Dependency Inversion Principle: High-level modules do not depend on low-level modules.


Clean code with modular architecture.

Reusable components for UI and logic.

## Architecture
The project follows the Clean Architecture pattern to ensure maintainability and scalability. It is divided into three primary layers:

Presentation Layer:

- Handles the UI and user interactions.

- Contains Flutter widgets and BLoC for state management.

- Includes localization support and reusable UI components.

Domain Layer:

- Contains core business logic, use cases, and interfaces.

- Ensures the separation of business rules from implementation details.

Data Layer:

- Manages data sources such as APIs and local storage.

- Utilizes Dio for network requests and repositories for data handling.

Benefits of Clean Architecture:

- Separation of Concerns: Each layer has a distinct responsibility.

- Testability: Easy to write unit tests for individual components.

- Scalability: Simplifies the addition of new features.

## Video
https://drive.google.com/file/d/1RJCy4vnNWbR6Q6gSqdF-iNtofUR3MJS7/view?usp=sharing

