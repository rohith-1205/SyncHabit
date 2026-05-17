# SyncHabit

**SyncHabit** is a futuristic AI-powered behavioral operating system focused on habits, deep work, burnout prevention, accountability, AI productivity optimization, adaptive scheduling, neural focus systems, and behavioral analytics.

The app is designed with an "Apple-level UX meets cyberpunk productivity OS" design philosophy, featuring an ultra-premium dark cinematic UI with futuristic neon-glassmorphism.

---

## FVM (Flutter Version Management) Setup

**IMPORTANT**: This project is strictly configured to use FVM. You must use `fvm flutter` for all commands. **Never use plain `flutter`**.

### Prerequisites

Ensure you have FVM installed:
```bash
dart pub global activate fvm
```

### Initializing the Project

1. Install the pinned Flutter SDK version:
```bash
fvm install
```

2. Get dependencies:
```bash
fvm flutter pub get
```

---

## Running the Application (Flavors)

The project implements exactly 3 flavors: `development`, `staging`, and `production`.

### 1. Development Flavor
- **App Name**: SyncHabit Dev
- **Package ID**: `com.synchabit.dev`
```bash
fvm flutter run --flavor development --target lib/main_development.dart
```

### 2. Staging Flavor
- **App Name**: SyncHabit Stage
- **Package ID**: `com.synchabit.stage`
```bash
fvm flutter run --flavor staging --target lib/main_staging.dart
```

### 3. Production Flavor
- **App Name**: SyncHabit
- **Package ID**: `com.synchabit.app`
```bash
fvm flutter run --flavor production --target lib/main_production.dart
```

---

## Building APKs

To build release APKs for each flavor:

```bash
# Development
fvm flutter build apk --flavor development --target lib/main_development.dart

# Staging
fvm flutter build apk --flavor staging --target lib/main_staging.dart

# Production
fvm flutter build apk --flavor production --target lib/main_production.dart
```

---

## Melos Integration

If using Melos for multi-package management or script execution:

```bash
# Bootstrap
melos bootstrap

# Run Linting
melos run lint

# Run Tests
melos run test

# Build APKs
melos run build:dev
melos run build:staging
melos run build:prod
```

---

## Project Architecture & Structure

Built using **Clean Architecture** and a **Feature-First** modular structure with **Riverpod** for state management and **GoRouter** for routing.

```
lib/
 ├── core/              # Core configuration, constants, theme, networking, services, widgets
 ├── features/          # Feature modules (auth, habits, focus, chrono, neuro, safe, retro, stats, duels, ai_engine, premium, settings)
 ├── shared/            # Shared UI components (Bottom navigation bar, glassmorphism containers)
 ├── routes/            # GoRouter routing configuration
 ├── l10n/              # Localization files
 ├── main/              # Main app bootstrap and root widget
 ├── main_development.dart
 ├── main_staging.dart
 └── main_production.dart
```
