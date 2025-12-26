# Laza E-Commerce Mobile App (MVP)
### Faculty of Computers and Data Science - Fall 2025
**Course:** Mobile App Development (Cybersecurity Program)

---

## 📌 Project Overview
Laza is a simplified, functional E-commerce Minimum Viable Product (MVP) developed using **Flutter**. This project demonstrates the implementation of modern mobile architecture, RESTful API integration, and cloud-based backend services.

**Goal:** To build a seamless shopping experience allowing users to browse products, manage a cart, save favorites, and simulate checkout processes using a single codebase for Android & iOS.

---

## 🚀 Key Features

### 1. Authentication & User Management
- **Firebase Auth:** Secure Sign Up and Login with Email/Password.
- **Secure Onboarding:** New users are guided through account creation and forced to re-login for security verification.
- **User Profile:** Displays user name and email in a dedicated side-drawer.

### 2. Product Catalog (API Integration)
- **Live Data:** Fetches real-time product data from the **Platzi Fake Store API**.
- **Search & Filter:** Local search functionality to filter products by name instantly.
- **Product Details:** Rich UI displaying high-quality images, descriptions, and pricing.

### 3. State Management & Persistence (Firestore)
- **Shopping Cart:** Users can add items, update quantities, and view real-time totals. Data is persisted in **Cloud Firestore** (`carts` collection).
- **Favorites:** Users can save items to a wishlist. Data is persisted in **Cloud Firestore** (`favorites` collection).
- **Mock Checkout:** Simulates a purchase flow with a success confirmation screen.

### 4. Quality Assurance
- **Automated Testing:** Includes Appium scripts for End-to-End (E2E) testing of Auth and Cart flows.
- **Error Handling:** Graceful handling of network errors and empty states.

---

## 🛠 Tech Stack
- **Framework:** Flutter (Dart)
- **Backend:** Firebase (Auth & Firestore)
- **API:** Platzi Fake Store API
- **State Management:** Provider
- **Testing:** Appium (Python Client)

---

## 💻 Setup & Installation Guide

To run this project on your local machine, follow these steps:

### 1. Clone the Repository
```bash
git clone https://github.com/jeromearsany/Laza-Ecommerce-MVP-2025.git
cd Laza-Ecommerce-MVP-2025
2. Install Dependencies
code
Bash
flutter pub get
3. Firebase Configuration
The project is pre-configured with android/app/google-services.json.
Note: This file contains the connection keys to the database. If the app fails to launch, ensure this file exists.
4. Run the App
Connect your Android Emulator or physical device and run:
code
Bash
flutter run
🧪 Testing (Appium)
To run the automated tests:
Start the Appium Server:
code
Bash
appium
Open a new terminal and run the Python script:
code
Bash
python appium_tests/tests.py
👥 Team Members
Student 1: Jerome Arsany
Student 2: [Teammate Name]
This project was developed as a final requirement for the Mobile App Development course.
code
Code
---

### **2. Answer to "How to Push the Connection?"**

You want to make sure the database connection is uploaded.

**The "Connection" is the file named `google-services.json`.**

Run these 3 commands in your VS Code terminal. This will upload the README you just created **AND** ensure the `google-services.json` is definitely on GitHub.

1.  **Add all files:**
    ```bash
    git add .
    ```

2.  **Commit the files:**
    ```bash
    git commit -m "Final Submission: Readme and Database Config"
    ```

3.  **Push to GitHub:**
    ```bash
    git push
    ```

**That is it.** Your teammate will now have the code, the instructions, and the database connection.
