💰 Expense Tracker App (Flutter)

A simple and modern Expense Tracker mobile application built with Flutter.
This app helps users track their daily expenses, categorize spending, and view total costs in an easy and clean interface.

🚀 Features
➕ Add new expenses
✏️ Edit existing expenses
🗑 Delete expenses
📊 View total spending
🏷 Categorize expenses (Food, Transport, Bills, etc.)
📅 Add date to each expense
💾 Local storage (SQLite-ready structure)
📱 Clean and responsive UI
🛠 Tech Stack
Flutter
Dart
Provider (State Management)
SQLite (local database structure)
Material Design

📂 Project Structure
lib/
│
├── main.dart
├── models/
│   └── expense.dart
├── providers/
│   └── expense_provider.dart
├── screens/
│   ├── home_screen.dart
│   └── add_expense_screen.dart
│   └── edit_expense_screen.dart
└── services/
    └── database_service.dart

    ⚙️ Getting Started
1. Clone the repository
   
git clone https://github.com/JhonataVini/flutter_application_learning.git

cd expense-tracker

3. Install dependencies
flutter pub get
4. Run the app
flutter run
📦 Build APK

To generate a release APK:

flutter build apk --release

APK will be located at:

build/app/outputs/flutter-apk/app-release.apk
🎯 Future Improvements
🔐 User authentication
☁️ Cloud sync (Firebase)
📈 Charts & analytics dashboard
💸 Budget limits & alerts
🔍 Search & filtering
🌙 Dark mode
👨‍💻 Author
Your Name: Jhonata Vinícius Almeida Lopes
