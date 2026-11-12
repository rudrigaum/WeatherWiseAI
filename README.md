
# WeatherWise AI 🌤️

**Plan smarter. Let the weather guide your decisions.**

WeatherWise AI is a native iOS application designed to help people plan everyday activities and events using weather data and AI-powered recommendations.

Instead of simply displaying temperatures and forecasts, WeatherWise AI aims to turn meteorological information into useful, contextual guidance.

> **Project Status:** Early development. The initial Xcode project and testing targets are configured. The features described below represent the planned MVP and are not yet implemented.

## Overview

WeatherWise AI combines publicly available weather information with natural language understanding to help users answer questions such as:

- "I'm going to a football match tomorrow. Will it be too hot?"
- "What's the best time to go running this weekend?"
- "I'm attending a concert in São Paulo next March. Should I bring a jacket?"
- "Is tomorrow a good day to visit the beach?"

The application will interpret the user's plans, identify relevant locations and dates, retrieve weather information, and generate recommendations grounded in available meteorological data.

WeatherWise AI is being developed as a demonstration of practical AI integration, native mobile engineering, and software architecture.

## Planned MVP

### Home

- Current weather conditions for the selected location.
- Hourly weather overview.
- Contextual activity suggestions.
- Optional access to the device's approximate location.
- Manual city selection.

### AI Planner

- Free-form natural language questions.
- Optional activity suggestion shortcuts.
- Interpretation of dates, locations, and user intentions.
- Clarification requests when essential information is missing.

### AI Analysis

- Context-aware weather recommendations.
- Structured results suitable for native UI components.
- Explanations supported by meteorological data.
- Weather data source attribution.
- Clear communication of uncertainty and unavailable information.

### Forecast

- Hourly meteorological forecasts.
- Relevant weather indicators.
- Historical weather information for dates outside the forecast horizon.
- Clear distinction between forecasts and historical data.

## Technology Stack

| Category | Technology | Status |
|---|---|---|
| Language | Swift 6 | Configured |
| User Interface | SwiftUI | Configured |
| Minimum iOS Version | iOS 17.0 | Configured |
| IDE | Xcode 27 | Configured |
| State Management | Observation (`@Observable`) | Planned |
| Concurrency | Swift Concurrency (`async/await`) | Planned |
| Architecture | Clean Architecture + MVVM | Planned |
| Networking | URLSession | Planned |
| Weather Data | Open-Meteo | Planned |
| Device Location | Core Location | Planned |
| AI Integration | Secure backend / API gateway | Planned |
| Unit Testing | Swift Testing | Initial target configured |
| UI Testing | XCTest / XCUIAutomation | Initial target configured |
| Code Quality | SwiftLint / SwiftFormat | Planned |
| CI/CD | GitHub Actions | Planned |
| Static Analysis | SonarQube Cloud | Planned |

The project prioritizes native Apple frameworks and avoids unnecessary third-party dependencies.

## Architecture

WeatherWise AI will follow **Clean Architecture + MVVM**, with clear separation of responsibilities.

The intended architecture contains three principal layers:

**Domain**

- Business entities and rules.
- Relevant use cases.
- Repository and service contracts.
- Domain-specific errors.

**Data**

- API clients and external services.
- Network DTOs and decoding.
- DTO-to-domain mapping.
- Repository implementations.
- Infrastructure error translation.

**Presentation**

- SwiftUI views and reusable components.
- Observable ViewModels.
- Presentation state management.
- Navigation and user interactions.

Dependencies will be injected through initializers where appropriate.

The architecture will prioritize testability, separation of concerns, and incremental evolution rather than premature abstraction or modularization.

## AI Integration

The AI integration will be implemented through a secure backend or API gateway.

The planned flow is:

1. The user describes an activity or event.
2. The system identifies the relevant intent, date, and location.
3. Weather information is retrieved from an appropriate source.
4. Deterministic business rules validate relevant conditions.
5. The AI produces a contextual explanation using validated data.
6. The application displays a structured result.

The application must not invent meteorological measurements or present historical weather information as an exact forecast.

The initial MVP will not independently verify whether a mentioned concert, football match, or other event is actually scheduled.

The AI provider and backend implementation are still to be determined.

## Weather Data

WeatherWise AI plans to use [Open-Meteo](https://open-meteo.com/) for weather forecasts and historical meteorological information.

Forecast availability depends on the supported forecasting model and endpoint.

For distant dates, the application will provide appropriately labeled historical context rather than pretending to know the exact weather conditions of a future event.

## Privacy and Security

Privacy is a core architectural requirement.

- Device location access will be optional.
- Approximate location will be preferred when sufficient.
- Users will be able to select cities manually.
- Location access will be requested only when relevant.
- Background location tracking is outside the MVP scope.
- Private AI provider credentials will never be embedded in the iOS application.
- Only necessary contextual information should be shared with external services.

## Getting Started

### Requirements

- macOS compatible with Xcode 27.
- Xcode 27.
- An installed iPhone simulator runtime supported by Xcode.
- Git.

### Clone the Repository

```bash
git clone https://github.com/rudrigaum/WeatherWiseAI.git
cd WeatherWiseAI
```

### Open the Project

Open `WeatherWiseAI.xcodeproj` in Xcode.

Select the `WeatherWiseAI` scheme and an available iPhone simulator.

Build the project using **Product → Build** (`⌘B`).

Run the application using **Product → Run** (`⌘R`).

The application currently displays the initial SwiftUI template interface.

## Testing

The project uses:

- **Swift Testing** for unit and integration tests.
- **XCTest / XCUIAutomation** for UI testing.

To execute the existing tests:

1. Open the project in Xcode.
2. Select the `WeatherWiseAI` scheme.
3. Select an available iPhone simulator.
4. Execute **Product → Test** (`⌘U`).

The initial test targets have been validated locally. Meaningful feature-specific test coverage will be introduced as implementation progresses.

Future tests will prioritize business rules, API mapping, location handling, AI response validation, error handling, and presentation state management.

## Roadmap

### Foundation

- [x] Create the iOS application.
- [x] Configure Swift 6 language mode.
- [x] Set the minimum deployment target to iOS 17.0.
- [x] Configure initial unit and UI test targets.
- [x] Initialize the Git repository.
- [x] Configure `.gitignore`.
- [ ] Add project documentation and governance.
- [ ] Configure SwiftLint and SwiftFormat.
- [ ] Configure GitHub Actions.
- [ ] Integrate SonarQube Cloud.

### Application

- [ ] Implement the Design System.
- [ ] Implement the main navigation.
- [ ] Implement the Home screen.
- [ ] Integrate Open-Meteo weather forecasts.
- [ ] Implement optional device location.
- [ ] Implement manual city selection.
- [ ] Implement the AI Planner.
- [ ] Integrate the AI backend.
- [ ] Implement the AI Analysis screen.
- [ ] Implement detailed and historical weather views.
- [ ] Add comprehensive automated tests.
- [ ] Improve accessibility and error handling.

## Cross-Platform Vision

WeatherWise AI is planned as two independent native applications:

- **iOS:** Swift and SwiftUI.
- **Android:** Kotlin and Jetpack Compose.

Both applications will share functional requirements and backend API contracts while retaining platform-native architecture and UI implementations.

This repository contains the iOS application only.

## Project Principles

Development follows these engineering principles:

- SOLID and separation of concerns.
- Clear architectural boundaries.
- Dependency injection.
- Testable business logic.
- Accessibility by design.
- Privacy and security by design.
- Incremental development and continuous validation.
- Conventional Commits and Pull Request reviews.
- Documentation of relevant technical decisions and trade-offs.

## License

A software license has not yet been selected.

The repository is publicly accessible, but no additional reuse or redistribution permissions are granted until a license is explicitly provided.
