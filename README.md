# Fintech Mobile Flutter Boilerplate

This Flutter boilerplate project is built as a solid and scalable foundation for developing mobile application in the fintech sector. It includes the fundamental structure and essential widgets to start developing applications in a fast and organized way.

---

## Tecnologies

* [Flutter](https://flutter.dev/) 3.29.2
  
* [Dart](https://dart.dev/) 3.7.2

---

## Main Features

* Optimized project structure
* Basic widgets implemented
* Integrated status management
* Standard Flutter design patterns

---

## Installation

Clone the repository:

```bash
git clone git@bitbucket.org:freshconsulting/fintech-mobile-flutter-boilerplate.git
```

Get the dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## Architecture

Based on the *Separation of Concerns (SoC)* design principle—which promotes dividing a program into distinct sections by encapsulating information within components that expose well-defined interfaces—this project uses the MVVM architecture pattern, following recommendations from the [Flutter architecture](https://docs.flutter.dev/app-architecture/guide) documentation.

This projetc is split into two broad layers, the UI layer and the Data layer.

### UI layer

  Responsable of interactions with the user.

* **Views**: composition of widgets that shouldn't contain bussiness logic. Pass events in response to user interactions
* **View models**: contains the logic that converts app data into UI state.

### Data layer

* **Repositories**: responsible for polling data from services, and transforming that raw data into domain models.
* **Services**: wrap API endpoints and expose asynchronous response objects.

**Architecture diagram**
![Architecture diagram](/assets/architecture_app.png)

### Package structure

The following is how the code is organized combining organization by *feature* and by *type*, Data layer aren't tied to a single feature, while UI layer are.

```markdown
lib
├─┬─ presentation
│ ├─┬─ core
│ │ ├─┬─ shared_widgets
│ │ │ └─── <widget_name>.dart
│ │ └─┬─ themes
│ │   └─── <app_theme>.dart
│ └─┬─ <FEATURE NAME>
├───├─── screens
│   ├─┬─ view_model
│   │ └─── <view_model class>.dart
│   └─┬─ widgets
│     ├── <feature name>_screen.dart
│     └── <other widgets>
├─┬─ domain
│ └─┬─ models
│   └─── <model name>.dart
├─┬─ data
│ ├─┬─ repositories
│ │ └─── <repository class>.dart
│ ├─┬─ services
│ │ └─── <service class>.dart
│ └─┬─ model
│   └─── <api model class>.dart
├─── config
├─── utils
├─── routing
└─── main.dart

// The test folder contains unit and widget tests
test
├─── data
├─── domain
├─── ui
└─── utils
```

---

## Environments

1. Copy the .env.template and rename it to .env
2. Change the value of environment variables

---
