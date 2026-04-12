<div align="center">

# 🌸 Flowery

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)

A modern, elegant, and fully functional Flutter e-commerce application designed for ordering flowers online, built with Clean Architecture.

</div>

---

## 🚀 Features

- **Authentication**: Secure user sign-up and login handling via Firebase Auth.
- **Product Browsing**: Explore a rich catalog of flowers and arrangements seamlessly.
- **Shopping Cart**: Add items, modify quantities, and manage your cart efficiently.
- **Order Management**: Track past and current orders effortlessly.
- **Clean Architecture**: Follows industry best practices, ensuring a highly scalable and testable codebase.

---

## 📸 Application Preview

<div align="center">

### 🌊 Authentication & Onboarding

<img src="screenshots/screenshot_1.png" width="19%" />
<img src="screenshots/screenshot_2.png" width="19%" />

### 🛍️ Product Catalog & Shopping

<img src="screenshots/screenshot_3.png" width="19%" />
<img src="screenshots/screenshot_4.png" width="19%" />
<img src="screenshots/screenshot_5.png" width="19%" />

### 🛒 Cart & Management

<img src="screenshots/screenshot_6.png" width="19%" />
<img src="screenshots/screenshot_7.png" width="19%" />

</div>

---

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **Design Pattern**: Clean Architecture
- **Backend / Services**: Firebase (Authentication, Cloud Firestore, Storage)

---

## 🏁 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.0.0 or higher recommended)
- [Dart SDK](https://dart.dev/get-dart)
- A Firebase project set up for iOS and Android

### Installation

1.  **Clone the repository**

    ```bash
    git clone https://github.com/Omar-Salah17/Flowery.git
    cd flowery
    ```

2.  **Install dependencies**

    ```bash
    flutter pub get
    ```

3.  **Setup Firebase Files**
    - Add your `google-services.json` file inside `android/app/`.
    - Add your `GoogleService-Info.plist` file inside `ios/Runner/`.

### Running the App

Run the application on your connected device or emulator:

```bash
flutter run
```

---

## 🏛️ Clean Architecture Deep-Dive

This project rigorously separates concerns into independent layers:

1. **Presentation Layer**: Contains the UI elements (Widgets, Screens) and State Management to handle user interactions.
2. **Domain Layer**: The core of the application holding business logic, containing Entities, Use Cases, and Repository Interfaces. This layer is entirely independent of other layers.
3. **Data Layer**: Responsible for data retrieval and submission. It includes API integrations, Firebase data sources, Data Transfer Objects (DTOs), and Repository implementations. 

---

## 📂 Project Structure

```text
lib/
├── core/           # Core utilities, theme, routing, and constants
├── data/           # Data sources (Firebase), DTOs, and repository implementations
├── domain/         # Entities, use cases, and repository interfaces
├── presentation/   # UI screens, custom widgets, and state management
└── main.dart       # Application entry point
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
