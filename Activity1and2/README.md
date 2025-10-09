# Dental Clinic Mobile App

A comprehensive Flutter mobile application for managing dental clinic operations, built with Dart.

## Project Structure

This project follows a clean architecture pattern with organized folders:

\`\`\`
lib/
├── main.dart                 # Application entry point
├── models/                   # Data models
│   ├── appointment.dart      # Appointment model with JSON serialization
│   └── patient.dart          # Patient model with age calculation
├── views/                    # UI screens/pages
│   ├── home_page.dart        # Main home screen with counter and navigation
│   ├── appointments_page.dart # Appointments screen with Material/Cupertino toggle
│   └── layouts_demo_page.dart # Layout demonstrations (Activities 1-10)
├── widgets/                  # Reusable UI components
│   ├── custom_button.dart    # Custom reusable button widget
│   └── appointment_card.dart # Appointment display card widget
└── services/                 # Business logic and data management
    ├── appointment_service.dart # Appointment CRUD operations
    └── patient_service.dart     # Patient CRUD operations
\`\`\`

## Why This Structure?

### Models Folder
Contains data classes that represent the core entities of our application. Models are separated to:
- Provide type safety and structure to our data
- Enable easy JSON serialization/deserialization
- Keep business logic separate from UI code
- Make data validation and transformation centralized

### Views Folder
Contains the main screens/pages of the application. Views are separated to:
- Organize different screens logically
- Make navigation structure clear
- Keep page-level state management isolated
- Enable easy addition of new screens

### Widgets Folder
Contains reusable UI components that can be used across multiple screens. Widgets are separated to:
- Promote code reusability and DRY principles
- Make UI components testable in isolation
- Simplify maintenance and updates
- Create a consistent design system

### Services Folder
Contains business logic and data management classes. Services are separated to:
- Keep business logic separate from UI code
- Enable easy testing of business logic
- Provide a single source of truth for data operations
- Make it easy to swap implementations (e.g., local storage to API)

## Features Implemented

### First Activity Set

#### 1. ✅ Hello World with StatelessWidget
The initial `DentalClinicApp` in `main.dart` is a StatelessWidget that serves as the root of the application.

#### 2. ✅ StatefulWidget with Counter
The `HomePage` is a StatefulWidget with a patient counter that can be incremented and reset using buttons.

#### 3. ✅ Custom Reusable Button Widget
`CustomButton` widget is used throughout the app with customizable:
- Text and icons
- Background and text colors
- Full-width or auto-sizing
- Used in both HomePage and AppointmentsPage

#### 4. ✅ Material Design and Cupertino Widgets
The `AppointmentsPage` demonstrates both design systems:
- Toggle between Material Design (Android) and Cupertino (iOS) styles
- Shows platform-specific components (switches, buttons, dialogs)
- Maintains functionality across both styles

#### 5. ✅ Navigation with Drawer and BottomNavigationBar
The app includes both navigation patterns:
- **BottomNavigationBar**: Switch between Home and Appointments tabs
- **Drawer**: Side menu with navigation options and app branding
- Demonstrates multiple navigation approaches

#### 6. ✅ Widget Tree Hierarchy

\`\`\`
DentalClinicApp (StatelessWidget)
└── MaterialApp
    └── HomePage (StatefulWidget)
        ├── Scaffold
        │   ├── AppBar
        │   ├── Drawer
        │   │   └── ListView
        │   │       ├── DrawerHeader
        │   │       └── ListTile (multiple)
        │   ├── Body (conditional based on _currentIndex)
        │   │   ├── Home Content
        │   │   │   └── SingleChildScrollView
        │   │   │       └── Column
        │   │   │           ├── Card (Welcome)
        │   │   │           ├── Card (Counter)
        │   │   │           │   └── CustomButton (reusable)
        │   │   │           └── Service Cards
        │   │   └── Appointments Content
        │   │       └── Column
        │   │           ├── AppointmentCard (reusable)
        │   │           └── CustomButton (reusable)
        │   └── BottomNavigationBar
        └── LayoutsDemoPage (accessible via Drawer)
            └── ListView of Activity Pages
                ├── Activity1Page (Row with equal spacing)
                ├── Activity2Page (Centered Column)
                ├── Activity3Page (Container styling)
                ├── Activity4Page (Profile card)
                ├── Activity5Page (Responsive layout)
                ├── Activity6Page (Navigation bar)
                ├── Activity7Page (Stack layout)
                ├── Activity8Page (Flexible widgets)
                ├── Activity9Page (Chat bubble UI)
                └── Activity10Page (Grid-like layout)
\`\`\`

#### 7. ✅ Refactored Widget Tree
Long widget trees have been refactored into:
- `CustomButton`: Reusable button component
- `AppointmentCard`: Appointment display component
- `_buildHomeContent()`: Separated home screen content
- `_buildAppointmentsContent()`: Separated appointments content
- `_buildDrawer()`: Separated drawer navigation
- `_buildServiceCard()`: Reusable service card builder

#### 8. ✅ Third-Party Package Integration
Added `flutter_staggered_grid_view: ^0.7.0` to `pubspec.yaml` for advanced grid layouts (ready to use for future features like photo galleries or service displays).

#### 9. ✅ Documentation
This README.md file documents the project structure, rationale, features, and widget hierarchy.

### Second Activity Set - Layout Demonstrations

All 10 layout activities are implemented in `layouts_demo_page.dart` and accessible via the Drawer menu:

#### Activity 1: Row with Equal Spacing
Demonstrates three Text widgets in a Row using `MainAxisAlignment.spaceEvenly` to create equal spacing between dental service categories.

#### Activity 2: Centered Column
Shows two buttons in a Column, centered both vertically and horizontally using `MainAxisAlignment.center` and `CrossAxisAlignment.center`.

#### Activity 3: Container Styling
Displays a Container with padding, margin, and background color around Text widgets, demonstrating proper spacing and visual hierarchy.

#### Activity 4: Profile Card Layout
Combines Row (for profile picture + name) and Column (for contact details) to create a professional dentist profile card.

#### Activity 5: Responsive Layout with Expanded
Uses Expanded widgets with different flex values to create responsive layouts that share screen width proportionally.

#### Activity 6: Navigation Bar with Row
Builds a custom navigation bar using Row with icons spaced evenly using `MainAxisAlignment.spaceEvenly`.

#### Activity 7: Stack Layout
Creates a Stack with a gradient background and floating action button overlay, demonstrating layered UI elements.

#### Activity 8: Flexible Widgets
Uses Flexible inside a Column to resize widgets dynamically, with different flex values showing proportional space distribution.

#### Activity 9: Chat Bubble UI
Implements a chat interface using Container with padding, margin, and rounded borders to create message bubbles.

#### Activity 10: Grid-like Layout
Combines Row and Column widgets to form a grid-like layout without using GridView, showing manual grid construction.

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (included with Flutter)
- Android Studio / VS Code with Flutter extensions
- iOS Simulator (Mac only) or Android Emulator

### Installation

1. Clone the repository
2. Navigate to the project directory
3. Install dependencies:
\`\`\`bash
flutter pub get
\`\`\`

4. Run the app:
\`\`\`bash
flutter run
\`\`\`

### Running on Different Platforms

\`\`\`bash
# Run on Android
flutter run -d android

# Run on iOS (Mac only)
flutter run -d ios

# Run on Web
flutter run -d chrome
\`\`\`

## Key Concepts Demonstrated

### First Activity Set
- **StatelessWidget vs StatefulWidget**: Understanding when to use each
- **State Management**: Using setState() for local state
- **Widget Composition**: Building complex UIs from simple widgets
- **Reusability**: Creating custom widgets that can be reused
- **Navigation**: Multiple navigation patterns (Drawer, BottomNavigationBar, push)
- **Platform Adaptation**: Material Design vs Cupertino widgets
- **Clean Architecture**: Separation of concerns (models, views, widgets, services)
- **Package Management**: Using third-party packages

### Second Activity Set
- **Row Widget**: Horizontal layout with various alignment options
- **Column Widget**: Vertical layout with flexible sizing
- **Container Widget**: Styling with padding, margin, borders, and colors
- **Expanded Widget**: Responsive layouts with proportional sizing
- **Flexible Widget**: Dynamic resizing based on available space
- **Stack Widget**: Layered UI elements with positioning
- **Layout Composition**: Combining Row and Column for complex layouts
- **Responsive Design**: Adapting to different screen sizes and orientations

## Future Enhancements

- Implement state management (Provider, Riverpod, or Bloc)
- Add database integration (SQLite or Firebase)
- Implement authentication and user roles
- Add appointment scheduling with calendar view
- Integrate payment processing
- Add patient medical history tracking
- Implement push notifications for appointment reminders

## License

This project is created for educational purposes.
