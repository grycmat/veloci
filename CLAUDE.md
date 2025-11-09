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

## Architecture

### Project Structure

```
lib/
  ├── main.dart              # App entry point, DynamicColor theme setup
  ├── screens/               # Full-page screens
  │   └── voting_screen.dart # Main poker voting interface
  ├── theme/                 # Theming configuration
  │   ├── theme.dart         # Material 3 light/dark themes
  │   └── colors.dart        # App color palette
  └── widgets/               # Reusable UI components
      └── voting/            # Voting-specific widgets
          ├── voting_card.dart           # Individual voting card (with hover state)
          ├── voting_card_container.dart # Grid layout for cards
          ├── votes_container.dart       # Bottom container with avatars and reveal button
          ├── votes_avatar.dart          # Participant avatar with vote indicator
          ├── voting_app_bar.dart        # Custom app bar
          ├── voting_header.dart         # Task title header
          ├── voting_description.dart    # Task description text
          └── voting_button.dart         # Custom button component
```

### Key Dependencies
- `flutter` (SDK ^3.9.2)
- `dynamic_color` (^1.8.1) - Dynamic color support from system/wallpaper
- `cupertino_icons` (^1.0.8) - iOS-style icons
- `flutter_lints` (^5.0.0) - Lint rules for code quality

### Theming System

The app uses Material 3 with a comprehensive theming system:
- `AppTheme` class provides `lightTheme()` and `darkTheme()` methods
- `DynamicColorBuilder` in main.dart adapts themes to system colors when available
- Custom color definitions in `lib/theme/colors.dart`
- Consistent design tokens: 16px border radius, 0 elevation, specific typography scale

### State Management

Currently uses Flutter's built-in StatefulWidget pattern:
- Local state in `_VotingScreenState` for selected card value
- Participant data (mock) stored in state
- Vote counting derived from participant data

### Widget Patterns

Widgets follow these conventions:
- Stateless widgets for presentation-only components
- Stateful widgets when hover states or animations are needed
- Theme-aware: all colors and text styles from `Theme.of(context)`
- Responsive: widgets adapt to theme brightness changes
