# Laza — E-Commerce Mobile App (MVP)

**Faculty of Computers and Data Science — Fall 2025**  
**Course:** Mobile App Development (Cybersecurity Program)

---

## Overview

Laza is a minimal, polished e-commerce **MVP (Minimum Viable Product)** built with **Flutter**. The goal is to demonstrate a complete mobile shopping experience using a single codebase for Android and iOS: user authentication, product browsing, cart management, favorites (wishlist), and a mock checkout flow. Backend services use **Firebase** (Authentication + Cloud Firestore) and product demo data is fetched from the Platzi Fake Store API.

This README is written in clear, professional, and simple English so teammates and graders can follow implementation, setup, testing and contribution steps easily.

---

## Project Goals

- Build a working cross-platform mobile app using Flutter.
- Use a modern app architecture with clear separation of UI, state, and data layers.
- Integrate a REST API for product data and use Firebase for persistence.
- Provide automated end-to-end tests for important user flows.
- Keep the app simple, secure (for an educational project), and easy to extend.

---

## Key Features

- **Authentication**
  - Email/password signup and login via Firebase Auth.
  - Secure onboarding flow with clear UX for first-time users.
  - Simple user profile (name & email) accessible from a side drawer.

- **Product Catalog**
  - Live demo product data fetched from the Platzi Fake Store API.
  - Instant local search (filter by name).
  - Product details with images, full description, and price.

- **Cart & Favorites**
  - Add/remove items, change quantities, and view totals.
  - Cart and favorites are persisted per user in Cloud Firestore.
  - Mock checkout flow with a success confirmation screen.

- **Quality & Testing**
  - Appium E2E test scripts for authentication and cart flows.
  - Graceful error handling for network problems and empty states.
  - Clean separation between presentation, state management, and services.

---

## Tech Stack

- **Framework:** Flutter (Dart)  
- **Backend:** Firebase (Authentication + Cloud Firestore)  
- **API (demo):** Platzi Fake Store API  
- **State management:** Provider  
- **E2E testing:** Appium (Python client)

---

## Prerequisites

Make sure you have these installed before running the app:

- Flutter SDK (stable channel) — installation: https://flutter.dev  
- Android Studio or Xcode (for emulators/simulators)  
- Git  
- Python 3.x and Appium Python client (for automated tests)  
- Appium server (for E2E tests)  
- An Android device/emulator or iOS simulator

---

## Quick Start — Installation & Run

1. **Clone the repository**
```bash
git clone https://github.com/jeromearsany/Laza-Ecommerce-MVP-2025.git
cd Laza-Ecommerce-MVP-2025
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
- Connect an Android device or start an emulator, then:
```bash
flutter run
```
- To specify a device:
```bash
flutter run -d <device-id>
```

---

## Firebase Configuration

> The Android configuration file `android/app/google-services.json` is expected for Android builds. For iOS, add `GoogleService-Info.plist` if you plan to run on iOS.

Short setup steps:

1. Create a Firebase project at the Firebase Console.
2. Add an Android app to that Firebase project. Ensure the package name matches the app's package in `android/app/src/main/AndroidManifest.xml`.
3. Download `google-services.json` and place it into `android/app/`.
4. (Optional) Add iOS app in Firebase and add `GoogleService-Info.plist` to the Xcode Runner project if you target iOS.

**Security note:** `google-services.json` contains Firebase configuration values. Avoid committing sensitive files to a public repository. Use private repos or secure distribution for class submissions if required.

---

## Testing — Appium End-to-End (E2E)

Automated E2E tests are included to verify authentication and cart flows.

1. **Start Appium server**
```bash
appium
```

2. **Install Python dependencies** (if provided)
```bash
pip install -r appium_tests/requirements.txt
```

3. **Run tests**
```bash
python appium_tests/tests.py
```

Make sure the app is installed on the target device/emulator and the Appium capabilities in the test script match the installed app package/activity.

---

## How to Push README and (Optional) Firebase Connection to GitHub

> Note: Committing `google-services.json` to a public repo is not recommended. If your repo is private and course rules permit, use the steps below to push files.

```bash
git add .
git commit -m "Final Submission: README and Firebase config (if permitted)"
git push origin main
```

Replace `main` with the branch you use.

---

## Project Structure (reference)

```
/android
/ios
/lib
  /models
  /providers
  /screens
  /services
  /widgets
  main.dart
/appium_tests
  tests.py
  requirements.txt
pubspec.yaml
README.md
```

- `models` — data models (e.g., Product, User, CartItem)  
- `providers` — Provider classes for app state (AuthProvider, CartProvider)  
- `screens` — UI screens (Home, ProductDetails, Cart, Login)  
- `services` — API and Firebase service wrappers  
- `widgets` — reusable UI components

Adapt this structure if your repository differs.

---

## Security Best Practices (for real apps)

- Do **not** commit private API keys or service account files to public repos.
- Use Firebase Security Rules to restrict read/write to authenticated users.
- Validate and sanitize user input client-side and server-side (if a server is added).
- Consider enabling email verification and enforcing strong password policies.

---

## Troubleshooting

- **Missing `google-services.json`** — place the file in `android/app/` or create a Firebase project and download the file.
- **Network failures** — check device/emulator internet connectivity and API base URLs.
- **Appium can't connect** — ensure Appium server is running and device is visible (`adb devices` for Android). Confirm desired capabilities.

---

## Contributing

Suggested workflow:

1. Fork the repo.
2. Create a branch:
```bash
git checkout -b feature/short-description
```
3. Make changes and test locally.
4. Commit and push:
```bash
git add .
git commit -m "Add: short description of change"
git push origin feature/short-description
```
5. Open a Pull Request with a clear explanation.

Keep changes focused and document any non-trivial logic in code comments.

---

## Roadmap — Ideas for Future Work

- Integrate a payment gateway (Stripe / PayPal sandbox).
- Add order history and order details.
- Improve search with categories and filters.
- Add unit and widget tests for core logic.
- Set up CI/CD to build and test on PRs.
- Improve accessibility and localization.

---

## License

If you choose to open source this project, add a `LICENSE` file. A common choice is the MIT License. Choose the license that matches your goals and institution rules.

---

## Acknowledgements

- Demo product data: Platzi Fake Store API  
- Backend services: Firebase (Auth & Firestore)  
- Testing framework: Appium (Python client)

---

## Contact

**Owner:** Jerome Arsany  
For questions or help, open an issue in this repository or contact the owner via their GitHub profile.

---

**If you want:** I can also generate a ready-to-paste `README.md` file, a `CONTRIBUTING.md`, or example `firebase.rules` for Firestore security. Tell me which one and I will add it.
