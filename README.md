# Veloci

A modern Flutter-based Scrum Poker application for agile estimation sessions.

## Overview

Veloci is a Planning Poker app that helps agile teams estimate story points collaboratively. Team members can create sessions, add tasks, and select their estimates using an intuitive card-based interface. Votes are revealed once everyone has participated.

## Features

- **Session Management** - Create and configure estimation sessions with descriptions
- **Task Creation** - Add tasks to sessions with title and description
- **Interactive Card Selection** - Visual poker cards with smooth animations and hover effects
- **Real-time Voting Status** - See who has voted with participant avatars
- **Material 3 Design** - Modern UI with dynamic color support from system theme
- **Dark Mode Support** - Automatic light/dark theme switching
- **Responsive Layout** - Works on mobile, tablet, and desktop platforms
- **Deep Linking** - URL-based navigation for web and mobile platforms

## Tech Stack

**Core Framework:**
- **Flutter** (SDK ^3.9.2) with Dart 3.9.2
- **Material 3** design system with SpaceGrotesk custom font

**Key Dependencies:**
- **go_router** (^17.0.0) - Declarative routing with deep linking
- **dynamic_color** (^1.8.1) - Adaptive theming from system colors
- **flutter_secure_storage** (^9.2.4) - Secure local data storage
- **drift** (^2.29.0) - Type-safe SQL database (configured for future use)
- **path_provider** (^2.1.5) - File system access

**Development Tools:**
- **flutter_lints** (^5.0.0) - Code quality and best practices
- **build_runner** (^2.10.1) - Code generation
- **flutter_launcher_icons** (^0.14.4) - App icon generation
- **flutter_native_splash** (^2.4.7) - Splash screen generation

## Getting Started

### Prerequisites

- Flutter SDK ^3.9.2 or higher
- Dart SDK
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd veloci
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Development

### Running Tests

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/path/to/test_file.dart
```

### Code Quality

```bash
# Run analyzer with configured lints
flutter analyze

# Format code
dart format .
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

### Asset Generation

```bash
# Generate launcher icons
dart run flutter_launcher_icons

# Generate splash screens
dart run flutter_native_splash:create
```

### Building

#### Android
```bash
flutter build apk
```

#### iOS
```bash
flutter build ios
```

#### Web
```bash
flutter build web
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── routing/               # Navigation configuration
│   ├── app_router.dart    # GoRouter setup and routes
│   └── route_names.dart   # Route path constants
├── screens/               # Full-page screens
│   ├── dashboard_screen.dart      # Landing page
│   ├── create_session_screen.dart # Session setup
│   ├── add_task_screen.dart       # Task creation
│   └── voting_screen.dart         # Main voting interface
├── theme/                 # Theming configuration
│   ├── theme.dart         # Material 3 themes
│   └── colors.dart        # Color palette
└── widgets/               # Reusable components
    └── voting/            # Voting-specific widgets
        ├── voting_card.dart              # Individual poker card
        ├── voting_card_container.dart    # Card grid layout
        ├── already_voted_container.dart  # Vote status display
        ├── already_voted_avatar.dart     # Participant avatars
        ├── voting_app_bar.dart           # Custom app bar
        ├── voting_header.dart            # Task title
        ├── task_description.dart         # Task description
        └── voting_button.dart            # Custom button
```

## User Flow

1. **Dashboard** - Start a new estimation session
2. **Create Session** - Enter session name and description
3. **Add Task** - Define the task to be estimated
4. **Voting** - Team members select their story point estimates

## Architecture

### Routing
The app uses **go_router** for declarative, URL-based navigation:
- Routes defined in `lib/routing/app_router.dart`
- Data passed between screens via `state.extra` parameter
- Deep linking support for web URLs

### Theming
Material 3 design with dynamic color adaptation:
- Light and dark themes defined in `lib/theme/theme.dart`
- System wallpaper color extraction via `dynamic_color` package
- **Custom Brand Colors**: Primary (#F20DF2), Secondary (#9D4EDD), Tertiary (#00D9FF)
- **Design Tokens**: 16px border radius, 0 elevation, SpaceGrotesk font family
- **Typography**: Complete Material 3 text theme with negative letter spacing
- Theme-aware components using `Theme.of(context)`

### State Management
Currently uses Flutter's built-in state management:
- Local state with `StatefulWidget`
- Route data passed via navigation
- No global state management library (future consideration: Riverpod or Bloc)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is private and not licensed for public use.
