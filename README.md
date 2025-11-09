# Veloci

A modern Flutter-based Scrum Poker application for agile estimation sessions.

## Overview

Veloci is a Planning Poker app that helps agile teams estimate story points collaboratively. Team members can select their estimates using an intuitive card-based interface, and votes are revealed once everyone has participated.

## Features

- **Interactive Card Selection** - Visual poker cards with smooth animations and hover effects
- **Real-time Voting Status** - See who has voted with participant avatars
- **Material 3 Design** - Modern UI with dynamic color support from system theme
- **Dark Mode Support** - Automatic light/dark theme switching
- **Responsive Layout** - Works on mobile, tablet, and desktop platforms

## Tech Stack

- **Flutter** (SDK ^3.9.2)
- **Material 3** design system
- **dynamic_color** package for adaptive theming
- **Dart** latest features

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
├── screens/               # Full-page screens
│   └── voting_screen.dart # Main voting interface
├── theme/                 # Theming configuration
│   ├── theme.dart         # Material 3 themes
│   └── colors.dart        # Color palette
└── widgets/               # Reusable components
    └── voting/            # Voting-specific widgets
        ├── voting_card.dart
        ├── votes_container.dart
        └── ...
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is private and not licensed for public use.
