# gearup

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

# Flutter Firebase E-Commerce App

## 📌 Project Overview
This is a Flutter mobile application integrated with Firebase.
The app includes:
- User authentication
- Shopping cart
- Favorites system
- Firestore database integration
- Automated testing using Appium

The project is built to support both **Android** and **iOS** platforms.

---

## 🛠️ Install Flutter & Project Dependencies

### 1. Install Flutter
- Download Flutter SDK from: https://flutter.dev/docs/get-started/install
- Add Flutter to your system PATH
- Verify installation:

Install Project Dependencies:
flutter pub get

Firebase setup:
Create a Firebase project from Firebase Console

Add Android & iOS apps to the Firebase project

Download:

google-services.json → android/app/

GoogleService-Info.plist → ios/Runner/

Enable Firestore Database

Enable Authentication (Email/Password)

📄 Detailed steps are available in firebase_setup.md

Firestore Rules installation:
Go to Firebase Console

Open Firestore Database → Rules

Replace existing rules with the content of:  firestore.rules

Run the App:
Android:
flutter run
ios:
cd ios
pod install
cd ..
flutter run

```text
project-root/
│── README.md
│── firebase_setup.md
│── firestore.rules
│
├── screenshots/
│   ├── home.png
│   ├── cart.png
│   └── favorites.png
│
├── lib/
├── android/
├── ios/


```bash
flutter doctor
