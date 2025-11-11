# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Veloci is a Flutter-based Scrum Poker application for agile estimation sessions. The app allows team members to vote on story points using a visual card interface.

## Development Commands

### Running the app
```bash
flutter run
```

### Building
```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

### Testing
```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test_file.dart
```

### Code Quality
```bash
# Run analyzer with configured lints (flutter_lints package)
flutter analyze

# Format code
dart format .
```

### Dependencies
```bash
# Install dependencies
flutter pub get

# Update dependencies
flutter pub upgrade
```

### Code Generation
```bash
# Generate Drift database files (for future database implementation)
dart run build_runner build

# Watch for changes and regenerate
dart run build_runner watch

# Clean and rebuild
dart run build_runner build --delete-conflicting-outputs
```

### Assets
```bash
# Generate launcher icons
dart run flutter_launcher_icons

# Generate splash screens
dart run flutter_native_splash:create
```

## Architecture

### Project Structure

```
lib/
  ├── main.dart              # App entry point, DynamicColor theme setup
  ├── routing/               # Navigation configuration
  │   ├── app_router.dart    # GoRouter configuration and routes
  │   └── route_names.dart   # Route path constants
  ├── screens/               # Full-page screens
  │   ├── dashboard_screen.dart      # Landing page
  │   ├── create_session_screen.dart # Session setup form
  │   ├── add_task_screen.dart       # Task creation form
  │   └── voting_screen.dart         # Main poker voting interface
  ├── theme/                 # Theming configuration
  │   ├── theme.dart         # Material 3 light/dark themes
  │   └── colors.dart        # App color palette
  └── widgets/               # Reusable UI components
      └── voting/            # Voting-specific widgets
          ├── voting_card.dart              # Individual voting card (with hover state)
          ├── voting_card_container.dart    # Grid layout for cards
          ├── already_voted_container.dart  # Bottom container with avatars and reveal button
          ├── already_voted_avatar.dart     # Participant avatar with vote indicator
          ├── voting_app_bar.dart           # Custom app bar
          ├── voting_header.dart            # Task title header
          ├── task_description.dart         # Task description text
          └── voting_button.dart            # Custom button component
```

### Key Dependencies

**Core Dependencies:**
- `flutter` (SDK ^3.9.2)
- `go_router` (^17.0.0) - Declarative routing with deep linking support
- `dynamic_color` (^1.8.1) - Dynamic color support from system/wallpaper
- `flutter_secure_storage` (^9.2.4) - Secure local data storage
- `drift` (^2.29.0) + `drift_flutter` (^0.2.7) - Type-safe reactive SQL database (configured but not yet implemented)
- `path_provider` (^2.1.5) - Access to file system paths
- `cupertino_icons` (^1.0.8) - iOS-style icons

**Dev Dependencies:**
- `flutter_lints` (^5.0.0) - Lint rules for code quality
- `drift_dev` (^2.29.0) - Code generation for Drift
- `build_runner` (^2.10.1) - Code generation tool
- `flutter_launcher_icons` (^0.14.4) - Generate app icons
- `flutter_native_splash` (^2.4.7) - Generate splash screens

**Custom Font:**
- SpaceGrotesk family (Light, Regular, Medium, Bold) - Used throughout the app

### Routing System

The app uses **go_router** for declarative, URL-based navigation:
- **Route Definitions**: All routes defined in `lib/routing/app_router.dart`
- **Route Constants**: Path strings centralized in `lib/routing/route_names.dart`
- **Data Passing**: Uses `state.extra` parameter with `Map<String, dynamic>` for passing data between screens
- **Deep Linking**: Supports web URLs and mobile deep links
- **404 Handling**: Custom error page with navigation back to dashboard

#### Navigation Flow
```
Dashboard (/)
    ↓
Create Session (/create-session)
    ↓ passes: sessionName, sessionDescription
Add Task (/add-task)
    ↓ passes: all session + task data
Voting (/voting)
```

**Key Pattern**: Use `context.go()` for route replacement, `context.push()` for stacking routes

### Theming System

The app uses Material 3 with a comprehensive theming system:
- `AppTheme` class provides `lightTheme()` and `darkTheme()` methods
- `DynamicColorBuilder` in main.dart adapts themes to system colors when available
- Custom color definitions in `lib/theme/colors.dart` with semantic color tokens
- **Design Tokens**: 16px border radius, 0 elevation, SpaceGrotesk font family
- **Typography**: Complete Material 3 text theme with negative letter spacing for headings
- Theme-aware: all widgets use `Theme.of(context)` for colors and text styles
- **Brand Colors**: Primary (#F20DF2), Secondary (#9D4EDD), Tertiary (#00D9FF)
- **Background**: Light (#F8F5F8), Dark (#221022) - consistent with splash screen

### State Management

Currently uses Flutter's built-in StatefulWidget pattern (no state management library):
- Local state in form screens for TextEditingControllers
- Route data passed via go_router's `extra` parameter
- Participant data (mock) stored in voting screen state
- Vote counting derived from participant data
- **Note**: No global state management - all data passed through navigation

### Widget Patterns

Widgets follow these conventions:
- **Stateless widgets** for presentation-only components
- **Stateful widgets** when forms, hover states, or animations are needed
- **Theme-aware**: All colors and text styles from `Theme.of(context)`
- **Responsive**: Widgets adapt to theme brightness changes
- **Reusable**: `VotingButton` used across screens for consistency
- **Material 3**: All components use Material 3 design system
