# WeatherWise AI 🌤️

**Plan smarter. Let the weather guide your decisions.**

WeatherWise AI is a native mobile project designed to help people plan activities and events using meteorological data and AI-powered contextual recommendations.

Instead of simply displaying weather forecasts, the application aims to transform reliable weather information into practical guidance.

> **Project Status:** Early development. The iOS foundation, Design System v1.0, code quality tooling, and CI pipeline are implemented. The initial Home interface and native tab navigation have been merged into `main` through [PR #7](https://github.com/rudrigaum/WeatherWiseAI/pull/7). Weather values remain illustrative; real meteorological data and AI integration are not implemented yet.

## Overview

WeatherWise AI aims to answer questions such as:

- "What's the best time to go running this weekend?"
- "Will it be too hot for a football match tomorrow?"
- "Should I bring a jacket to a concert next month?"
- "Is tomorrow a good day to visit the beach?"

The application will interpret the user's plans, identify relevant dates and locations, retrieve appropriate meteorological information, and provide recommendations grounded in validated data.

## Current Implementation

### iOS Foundation

- Swift 6 and SwiftUI.
- iOS 17+ deployment target.
- Design System v1.0 with semantic colors, typography, spacing, shapes, and reusable components.
- Light Mode and Dark Mode support.
- SwiftLint and SwiftFormat.
- GitHub Actions for lint, format verification, build, and unit tests.
- Swift Testing and XCTest test targets.

### Home Screen

The initial Home implementation includes:

- Current weather presentation using illustrative values.
- Hourly weather overview.
- Daily activity suggestion.
- Primary AI planning action.
- Native tab navigation for Home, Planner, and Forecast.
- Placeholder screens for unfinished features.
- UI test coverage for navigation and Home actions.

**Important:** Weather values are demonstrative and must not be interpreted as live meteorological observations or forecasts.

Manual city selection and device location access are not implemented yet. Their current actions provide informational feedback without requesting location permissions.

## Planned MVP

### Home

Display current weather conditions, hourly forecasts, contextual suggestions, and location controls using real meteorological data.

### AI Planner

Accept free-form questions about activities and events, interpret dates and locations, and request clarification when essential details are missing.

### AI Analysis

Present structured recommendations supported by validated meteorological information, source attribution, and clear explanations of uncertainty.

### Forecast

Display detailed forecasts and relevant weather indicators. Provide clearly labeled historical information when a requested date falls outside the available forecast horizon.

## Technology Stack

| Category | Technology | Status |
|---|---|---|
| Language | Swift 6 | Configured |
| UI | SwiftUI | Configured |
| Minimum iOS Version | iOS 17 | Configured |
| IDE | Xcode 27 | Configured |
| Design System | Native SwiftUI components | Implemented |
| State Management | Observation | Planned for stateful features |
| Concurrency | Swift Concurrency | Planned for asynchronous operations |
| Architecture | Clean Architecture + MVVM | Incremental adoption |
| Networking | URLSession | Planned |
| Weather Provider | Open-Meteo | Planned |
| Location | Core Location | Planned |
| AI Integration | Secure backend / API gateway | Planned |
| Unit Testing | Swift Testing | Configured |
| UI Testing | XCTest / XCUIAutomation | Home navigation test implemented |
| Code Quality | SwiftLint / SwiftFormat | Configured |
| CI | GitHub Actions | Implemented |
| Static Analysis | SonarQube Cloud | Planned |

The project prioritizes native Apple frameworks and avoids unnecessary external dependencies.

## Architecture

WeatherWise AI follows an incremental Clean Architecture + MVVM approach.

The intended responsibility boundaries are:

### Domain

- Business entities and rules.
- Use cases for meaningful domain behavior.
- Repository and service contracts when dependency inversion is needed.
- Domain-specific error handling.

### Data

- API clients and infrastructure services.
- Network DTOs and decoding.
- Mapping between external data and domain models.
- Repository implementations.
- External error translation.

### Presentation

- SwiftUI views and reusable components.
- ViewModels using Observation when state management is required.
- UI state and interaction handling.
- Navigation and presentation models.

The current implementation focuses on the UI foundation. Domain and Data capabilities will be introduced as real requirements are implemented.

Dependencies should be injected explicitly, primarily through initializers.

## Weather Data and AI

Open-Meteo is the planned initial weather data provider.

The application must distinguish between:

- Forecast data within a supported forecast horizon.
- Historical meteorological information.
- Missing or unavailable weather data.

Historical information must never be presented as an exact forecast for a future event.

AI integration will use a backend or API gateway. Private provider credentials must not be embedded in the mobile application.

The intended analysis flow is:

1. Interpret the user's request.
2. Identify relevant dates, locations, and activities.
3. Retrieve appropriate meteorological information.
4. Validate weather facts and deterministic business rules.
5. Generate a contextual explanation using validated data.
6. Display a structured, source-aware result.

The AI must not invent weather measurements, dates, or source information.

The MVP does not independently verify whether a referenced concert, sporting event, or other activity is actually scheduled.

## Privacy and Security

Privacy is a core architectural requirement.

- Device location access will be optional.
- Approximate location will be preferred when sufficient.
- Users will be able to select a city manually.
- Location permission will be requested only when the user initiates a relevant action.
- Background location tracking is outside the MVP scope.
- Private AI provider credentials will not be stored in the application.
- Only necessary contextual information should be transmitted to external services.

## Getting Started

### Requirements

- macOS compatible with Xcode 27.
- Xcode 27.
- A compatible iOS simulator runtime.
- Git.
- SwiftLint 0.65.0 and SwiftFormat 0.63.0 for local quality checks.

### Clone

```bash
git clone https://github.com/rudrigaum/WeatherWiseAI.git
cd WeatherWiseAI
```

### Open and Run

Open `WeatherWiseAI.xcodeproj` in Xcode.

Select the `WeatherWiseAI` scheme and an available iPhone simulator.

Build with **Product > Build** or `Command + B`.

Run with **Product > Run** or `Command + R`.

The current Home screen displays illustrative weather values. Live forecasts are not available yet.

### Command-Line Build

```bash
xcodebuild build \
  -project WeatherWiseAI.xcodeproj \
  -scheme WeatherWiseAI \
  -configuration Debug \
  -destination 'generic/platform=iOS Simulator' \
  CODE_SIGNING_ALLOWED=NO
```

## Code Quality

Run SwiftLint:

```bash
swiftlint lint --config .swiftlint.yml
```

Run SwiftFormat in lint mode:

```bash
swiftformat --lint . --config .swiftformat
```

Check for whitespace errors:

```bash
git diff --check
```

The GitHub Actions workflow validates formatting, linting, builds, and unit tests on pull requests targeting `main`.

## Testing

The project uses:

- **Swift Testing** for unit and integration tests.
- **XCTest / XCUIAutomation** for UI tests.

To run tests locally, open Xcode, select an available simulator, and use **Product > Test**.

The navigation UI test introduced in [PR #7](https://github.com/rudrigaum/WeatherWiseAI/pull/7) covers Home actions and navigation among the main tabs.

UI tests are not currently included in the default CI workflow.

Upcoming test coverage will focus on weather mapping, date interpretation, location permissions, error handling, cancellation, and AI response validation.

## Roadmap

### Foundation

- [x] Create the iOS application.
- [x] Configure Swift 6 and iOS 17+.
- [x] Configure unit and UI test targets.
- [x] Initialize Git repository and `.gitignore`.
- [x] Configure SwiftLint and SwiftFormat.
- [x] Configure GitHub Actions.
- [x] Implement Design System v1.0.
- [ ] Complete repository governance.
- [ ] Evaluate SonarQube Cloud integration.

### Application

- [x] Integrate initial Home and tab navigation into `main` (PR #7).
- [ ] Integrate Open-Meteo forecasts.
- [ ] Implement manual city selection.
- [ ] Implement optional device location.
- [ ] Implement the AI Planner.
- [ ] Integrate the secure AI backend.
- [ ] Implement the AI Analysis screen.
- [ ] Implement detailed forecast and historical weather screens.
- [ ] Expand automated test coverage.
- [ ] Validate accessibility across critical flows.

## Cross-Platform Vision

WeatherWise AI is being developed as two independent native applications:

- **iOS:** Swift and SwiftUI.
- **Android:** Kotlin and Jetpack Compose.

The applications will share functional requirements and backend API contracts, but not UI implementations or platform-specific architecture.

**This repository contains only the iOS application.**

## Project Principles

- Clean Architecture and separation of concerns.
- SOLID, DRY, and KISS where appropriate.
- Dependency injection.
- Testable business logic.
- Accessibility by design.
- Privacy and security by design.
- Swift Concurrency and structured concurrency.
- Incremental development.
- Conventional Commits and Pull Request reviews.
- Explicit documentation of architectural decisions and trade-offs.

## License

A software license has not yet been selected.

The repository is publicly accessible, but no additional reuse or redistribution permissions are granted until a license is explicitly provided.
