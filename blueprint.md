
# Project Blueprint

## Overview

This document outlines the architecture, features, and design principles for the CourtNinjas application. It serves as a single source of truth for the development plan.

---

## **Current Plan: Events Feature**

### 1. Purpose

To allow users to create, discover, join, and manage events within the application. This will be the primary feature for community engagement.

### 2. Data Model (Firestore)

We will use Firestore to store our event data.

*   **`events` Collection:** The root collection for all event data.
    *   **Event Document:** Each document represents a single event.
        *   `title` (String): The name of the event.
        *   `description` (String): Detailed information about the event.
        *   `imageUrl` (String): URL for a header image. We'll start with dynamic placeholders.
        *   `dateTime` (Timestamp): The date and time of the event.
        *   `location` (String): The address or place of the event.
        *   `creatorId` (String): The UID of the user who created the event.
        *   `creatorName` (String): The name of the creator.
    *   **`rsvps` Subcollection:** Inside each event document.
        *   **RSVP Document:** Each document represents a user's RSVP. The document ID will be the user's UID.
            *   `status` (String): "going", "interested".

### 3. UI/UX Design & Visuals

The UI will be modern, intuitive, and visually appealing, following the aesthetic guidelines.

*   **Events List Screen (`/events`):**
    *   **Layout:** A vertical list of event cards.
    *   **Event Cards:** Each card will have a "lifted" appearance with a multi-layered drop shadow. It will display a prominent image, the event title, date, and location.
    *   **Visuals:** We'll use expressive typography to highlight the event title. A subtle noise texture will be applied to the background to add a premium feel.
    *   **Interactivity:** A "floating action button" with a "glow" effect will allow users to create a new event.

*   **Event Details Screen (`/events/:id`):**
    *   **Layout:** A screen with a large hero image at the top, followed by the event title, description, a map view placeholder, and a list of attendees.
    *   **Interactivity:** Prominent "Join Event" and "I'm Interested" buttons with clear visual states (e.g., color change on RSVP).

*   **Create Event Screen (`/create-event`):**
    *   **Layout:** A clean and simple form with text fields for all event details and a date/time picker.

### 4. Application Architecture & Implementation

*   **Routing (go_router):** We will add the following new routes:
    *   `/events`: For the main events list.
    *   `/events/:id`: For event details, passing the event ID as a parameter.
    *   `/create-event`: For the event creation form.
*   **Services (Repository Pattern):**
    *   Create `lib/services/event_service.dart`. This class will contain all the logic for interacting with the Firestore `events` collection (e.g., `getEvents()`, `getEventById(id)`, `createEvent(eventData)`, `rsvpToEvent(eventId, status)`).
*   **State Management (Provider):**
    *   Create `lib/providers/event_provider.dart`. This `ChangeNotifier` will fetch and hold the list of events and manage the state for the UI, notifying widgets when data changes.
*   **Models:**
    *   Create `lib/models/event.dart` to define the `Event` class, which will structure our event data.

### 5. Implementation Steps

1.  **Firebase Setup:** Ensure Firestore is enabled in the Firebase project.
2.  **Add Dependencies:** Add `cloud_firestore` to `pubspec.yaml`.
3.  **Create Models & Services:** Implement the `Event` model and `EventService`.
4.  **Create Provider:** Implement the `EventProvider`.
5.  **Build UI Screens:** Create the new screens for listing, viewing, and creating events.
6.  **Integrate Routing:** Add the new routes to `lib/router.dart`.
7.  **Update Navigation:** Add an "Events" item to the main navigation sidebar in `home_screen.dart`.

This plan provides a robust foundation for the new events feature. It aligns with our established architecture and prioritizes a high-quality user experience.

I will now wait for your confirmation before proceeding with the implementation.
