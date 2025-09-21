# CourtNinjas App Blueprint

## Overview

This document outlines the architecture, features, and design of the CourtNinjas Flutter application. It serves as a living blueprint for the project, tracking its evolution from the initial setup to its current state.

## 1. Initial Setup & Core Dependencies

- **Project Initialization**: Standard Flutter project created with `flutter create`.
- **Routing**: `go_router` is used for declarative navigation, providing a structured and scalable routing solution.
- **Firebase Integration**: The application is connected to a Firebase project named "courtninjas" to leverage its backend services.

### Key Dependencies:

- `flutter`: The core framework for building the application.
- `go_router`: For handling all navigation and routing.
- `firebase_core`: To initialize and connect to Firebase.
- `firebase_auth`: For user authentication.
- `cloud_firestore`: As the primary database for storing application data.

## 2. Architecture & Design

### State Management

- The application will follow a provider-based state management approach for its simplicity and effectiveness in sharing state across the widget tree.

### Project Structure

The project is organized into the following directories:

- `lib/`
  - `screens/`: Contains all the individual screens of the application.
  - `widgets/`: For reusable UI components.
  - `models/`: Data models representing the application's data structures.
  - `services/`: For services that interact with Firebase or other external APIs.
  - `router.dart`: Defines all the application's routes using `go_router`.
  - `main.dart`: The main entry point of the application.

## 3. Implemented Features

### 3.1. Firebase Configuration

- **Firebase Project Connection**: The app is successfully connected to the "courtninjas" Firebase project.
- **Configuration File**: The `firebase_options.dart` file has been generated and is included in the project, enabling seamless Firebase integration for Android, iOS, and web.
- **Authentication**: Firebase Authentication has been set up to handle user login and registration.

### 3.2. Routing & Navigation

- **Declarative Routing**: The `go_router` package is configured to manage all navigation within the app.
- **Initial Route**: The app's initial route is set to `/events`.
- **Custom Transitions**: A custom fade transition is implemented for all page navigation, providing a smooth user experience.

## 4. Current Plan & Next Steps

- **Current Task**: Resolve all compilation errors and establish a stable, runnable application.
- **Next Steps**:
  1.  Fix the name collision between the custom transition widget and the `go_router` package by renaming the custom widget to `AppCustomTransitionPage`.
  2.  Correct the implementation of the custom transition widget to align with the latest version of `go_router`.
  3.  Update the router to use the new and corrected transition widget.
  4.  Verify that all compilation errors are resolved and the application runs successfully.
