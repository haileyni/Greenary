# Greenary
 comp826
# My Flutter App

This repository contains a Flutter project.

## Installation

Follow the steps below to set up your development environment for Flutter， VScode and SQLite.

## Installation

Make sure your development environment meets the following requirements:

- Windows 10 or higher (64-bit operating system)
- At least 1.64 GB of available disk space
- Developer mode enabled

### 1. Install Flutter

1. Visit the [Flutter website](https://flutter.dev/) to download the Flutter SDK.
2. Follow the installation instructions for your specific operating system.
3. Follow any additional instructions provided by `flutter doctor` to resolve any issues.

### 2. Set Up Visual Studio Code (VS Code)

1. Download and install [Visual Studio Code](https://code.visualstudio.com/).
2. Open VS Code and go to the Extensions view by clicking on the square icon in the sidebar or using `Ctrl+Shift+X`.
3. Search for the "Flutter" extension and click "Install" to install the Flutter plugin.
4. Search for the "Dart" extension and click "Install" to install Dart.

### 3. Install SQLite
- Download the SQLite tools and binaries from the [SQLite Download Page](https://www.sqlite.org/download.html).
- Extract the downloaded archive to a preferred directory.
- Add the directory containing `sqlite3.exe` to your system's `PATH` environment variable.

### 4. Configure Flutter

1. Open your Flutter project in VS Code.
2. Run the following command in the terminal to ensure your Flutter environment is set up properly:
flutter doctor

r
Copy code
Follow any additional instructions provided by `flutter doctor` to resolve any issues.

### 5. SQLite Setup

1. Add the `sqflite` package to your `pubspec.yaml` file:
```yaml
dependencies:
  sqflite: ^2.0.0
  
Run flutter pub get to fetch the package.
Now your development environment is ready for Flutter and SQLite development.

Usage
You can now start developing your Flutter app and use SQLite for local database needs. Refer to the Flutter documentation and SQLite documentation for more information.

License
This project is licensed under the MIT License - see the LICENSE file for details.






