# Laza — E-Commerce Mobile App (MVP) 🚀🛍️

**Faculty of Computers and Data Science — Fall 2025**  
**Course:** Mobile Programming 🧑‍💻

---

## Overview 📌

Laza is a minimal, polished e-commerce **MVP (Minimum Viable Product)** built with **Flutter**. The app demonstrates a complete mobile shopping experience using a single codebase for Android and iOS: user authentication, product browsing, cart management, wishlist (favorites), and a mock checkout flow. Backend services use **Firebase** (Authentication + Cloud Firestore) and product demo data is retrieved from the Platzi Fake Store API.

This README uses simple, professional English so teammates and graders can follow implementation, setup, testing, and contribution steps easily. ✅

---

## Project Goals 🎯

- Build a working cross-platform mobile app using Flutter.  
- Use a clear, modern architecture with separation of UI, state, and data layers. ⚙️  
- Integrate a REST API for product data and Firebase for persistent state. ☁️  
- Provide automated end-to-end tests for critical flows. 🧪  
- Keep the app simple, secure (for educational use), and easy to extend. 🔧

---

## Key Features ✨

- **Authentication** 🔐  
  - Email/password signup and login via Firebase Auth.  
  - Secure onboarding with clear UX for first-time users.  
  - Simple user profile (name & email) in a side drawer.

- **Product Catalog** 📦  
  - Live demo product data from the Platzi Fake Store API.  
  - Instant local search (filter by product name). 🔎  
  - Product details screen with images, description, and price.

- **Cart & Favorites** 🛒❤️  
  - Add/remove items, update quantities, view totals.  
  - Cart and favorites persisted per user in Cloud Firestore.  
  - Mock checkout flow with success confirmation screen.

- **Quality & Testing** 🧰  
  - Appium E2E test scripts for authentication and cart flows.  
  - Graceful error handling for network issues and empty states. ⚠️  
  - Clean separation between presentation, state management, and services.

---

## Tech Stack 🧩

- **Framework:** Flutter (Dart)  
- **Backend:** Firebase (Authentication + Cloud Firestore)  
- **API (demo):** Platzi Fake Store API  
- **State management:** Provider  
- **E2E testing:** Appium (Python client)

---

## Prerequisites ✅

Install these before running the app:

- Flutter SDK (stable channel) — see https://flutter.dev  
- Android Studio or Xcode (emulator / simulator)  
- Git  
- Python 3.x and Appium Python client (for tests) 🐍  
- Appium server (for E2E tests)  
- An Android device/emulator or iOS simulator

---

## Quick Start — Installation & Run ⚡

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

## Firebase Configuration 🔑

> Android expects `android/app/google-services.json`. For iOS, add `GoogleService-Info.plist` if you target iOS.

Short setup:

1. Create a Firebase project at the Firebase Console.  
2. Add an Android app to that Firebase project; package name must match `android/app/src/main/AndroidManifest.xml`.  
3. Download `google-services.json` and place it into `android/app/`.  
4. (Optional) For iOS add `GoogleService-Info.plist` to the Xcode Runner project.

**Security note:** `google-services.json` contains configuration values. Avoid committing sensitive files to a public repo. Use a private repo or secure distribution as required by course rules. 🔒

---

## Testing — Appium End-to-End (E2E) 🧪

Automated E2E tests verify authentication and cart flows.

1. **Start Appium server**
```bash
appium
```

2. **Install Python dependencies** (if present)
```bash
pip install -r appium_tests/requirements.txt
```

3. **Run tests**
```bash
python appium_tests/tests.py
```

Ensure the app is installed on the device/emulator and Appium desired capabilities in the test script match the installed app package/activity. 🔍

---

## How to Push README and (Optional) Firebase Connection to GitHub 📤

> ⚠️ Reminder: Do **not** commit `google-services.json` to a public repo unless explicitly permitted.

If allowed and your repository is private:

```bash
git add .
git commit -m "Final Submission: README and Firebase config (if permitted)"
git push origin main
```

Replace `main` with your branch if different.

---

## Project Structure (reference) 📁

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

- `models` — data models (Product, User, CartItem)  
- `providers` — Provider classes for app state (AuthProvider, CartProvider)  
- `screens` — UI screens (Home, ProductDetails, Cart, Login)  
- `services` — API and Firebase service wrappers  
- `widgets` — reusable UI components

Adapt this to your actual repo layout. 🗂️

---

## Security Best Practices 🔒

- Never commit private API keys or service account files to public repos.  
- Use Firebase Security Rules to restrict read/write to authenticated users.  
- Validate and sanitize user input client-side and server-side (if you add a server).  
- Consider enabling email verification and enforce strong password policies.

---

## Troubleshooting 🛠️

- **Missing `google-services.json`** — place the file in `android/app/` or create a Firebase project and download the file.  
- **Network failures** — check device/emulator internet connection and API base URLs.  
- **Appium cannot connect** — ensure Appium server is running and the device is visible (`adb devices` for Android). Check desired capabilities.

---

## Contributing 🤝

Suggested workflow:

1. Fork the repository.  
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

Keep changes focused and add comments for non-trivial logic. 📝

---

## Roadmap — Ideas for Future Work 💡

- Add payment gateway integration (Stripe / PayPal sandbox). 💳  
- Add order history and order details. 🧾  
- Improve search with categories and filters. 🔎  
- Add unit and widget tests for core logic. ✅  
- Set up CI/CD to build and test PRs automatically. 🔁  
- Improve accessibility and localization. 🌐

---

## License 📜

If you open source the project, add a `LICENSE` file. A common choice is the **MIT License**. Choose a license that matches your goals and institutional rules.

---

## Acknowledgements 🙏

- Demo product data: Platzi Fake Store API  
- Backend: Firebase (Auth & Firestore)  
- Testing: Appium (Python client)

---

## Team Members 👥

- **Jerome Arsany** — Developer (contributed equally)  
- **Botamina Kamel** — Developer (contributed equally)

Both team members worked together on all parts of the project (design, implementation, testing, and documentation). There were no separate or assigned roles — all work was shared and both members contributed equally.


---

If you want, I can also:
- Convert this README into a ready-to-paste `README.md` file. 📝  
- Add a `CONTRIBUTING.md` or `SECURITY.md`. 🔐  
- Create a sample `firebase.rules` for Firestore permissions. 🛡️

Tell me which one you'd like next and I'll generate it. 😊
