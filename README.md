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

- **Flutter** (SDK ^3.9.2)
- **go_router** (^17.0.0) - Declarative routing with deep linking
- **Material 3** design system
- **dynamic_color** package for adaptive theming
- **flutter_secure_storage** for local data storage

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
flutter test
```

### Code Analysis

```bash
flutter analyze
```

### Code Formatting

```bash
dart format .
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
        ├── voting_card.dart
        ├── voting_button.dart
        ├── votes_container.dart
        └── ...
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
- Consistent 16px border radius across components

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
