# Project Blueprint

## Overview

This document outlines the design, features, and development plan for the CourtNinjas Flutter application. It serves as a single source of truth for the project's current state and future direction.

## Current Features & Design

### Style and Design
- **Theme:** Modern, dark theme with a black and dark grey gradient.
- **Animations:** Fade-in and fade-out transitions are used for navigating between screens, providing a smooth user experience.
- **Layout:** The main application interface uses a `NavigationRail` for primary navigation on the left, with the main content area displayed on the right.
- **AppBar:** The central `AppBar` displays the application title, "CourtNinjas," with a "Home" button (icon and text) on the left and a "Logout" button on the right.

### Features
- **Login:** A simple login screen to start.
- **Home Screen:** The main container for the app's features after login.
- **Navigation Rail:** Provides access to the following sections:
    - Playing
    - Set Availability
    - Captain
    - Pending Invites
    - Challenges
    - Following

## Development Plan (Latest Change)

- **Task:** Refactor navigation and UI elements.
- **Steps Taken:**
    1. Replaced the default sliding animation for screen transitions with a fade animation for a more subtle effect.
    2. Modified the "Home" button in the `AppBar` to include the text "Home" next to the icon for better clarity.
    3. Resolved a build issue by removing an incorrect `tooltip` property and wrapping the button in a `Tooltip` widget, then ultimately removing it based on user feedback.
