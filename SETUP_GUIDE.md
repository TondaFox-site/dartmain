# Flutter Authentication App with Firebase

This Flutter application features a beautiful splash screen with Firebase authentication (login and registration).

## 📱 Features

- **Splash Screen**: Beautiful welcome screen with app logo, welcome text, and login button
- **Authentication**: Firebase-based login and registration
- **User Management**: Display user information on home screen
- **Responsive Design**: Beautiful gradient backgrounds and modern UI
- **State Management**: Automatic navigation based on authentication state

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.11.4+)
- Firebase account
- Firebase CLI (optional but recommended)

### Firebase Setup

1. **Create a Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project
   - Enable Authentication (Email/Password)

2. **Configure Firebase for Your Platforms**:

   **For Android:**
   ```bash
   flutterfire configure --project=YOUR_PROJECT_ID
   ```

   **Or manually:**
   - Download `google-services.json` from Firebase Console
   - Place it in `android/app/`

   **For iOS:**
   ```bash
   flutterfire configure --project=YOUR_PROJECT_ID
   ```

   **Or manually:**
   - Download `GoogleService-Info.plist` from Firebase Console
   - Add it to Xcode: Right-click Runner → Add Files to "Runner"

3. **Update Firebase Options**:
   - If using `flutterfire configure`, update `lib/firebase_options.dart` automatically
   - Or manually update with your Firebase credentials from Firebase Console

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── main.dart                 # App entry point with Firebase init and auth check
├── firebase_options.dart     # Firebase configuration
└── screens/
    ├── splash_screen.dart    # Welcome/splash screen
    ├── login_screen.dart     # Login with Firebase Auth
    ├── register_screen.dart  # Registration with Firebase Auth
    └── home_screen.dart      # Main app after authentication
```

## 🎯 App Flow

1. **Launch App** → Check authentication state
2. **Not Authenticated** → Show Splash Screen
3. **Click "Get Started"** → Navigate to Login Screen
4. **Login or Register** → Firebase authentication
5. **Authenticated** → Show Home Screen with user info
6. **Logout** → Back to Splash Screen

## 🎨 Customization

### Change App Logo/Image
In `splash_screen.dart`, replace the `Icon` widget with your image:
```dart
// Replace this:
child: const Icon(
  Icons.flutter_dash,
  size: 80,
  color: Colors.deepPurple,
),

// With your image:
child: Image.asset(
  'assets/logo.png',
  width: 80,
  height: 80,
),
```

### Change Colors
All screens use `Colors.deepPurple` as the primary color. Update the theme in `main.dart`:
```dart
colorScheme: ColorScheme.fromSeed(seedColor: Colors.YOUR_COLOR),
```

### Add Assets (Images, Fonts)
Update `pubspec.yaml`:
```yaml
flutter:
  assets:
    - assets/images/
  fonts:
    - family: CustomFont
      fonts:
        - asset: assets/fonts/custom.ttf
```

## 📝 Next Steps

After setting up Firebase:
1. Test login/registration with test credentials
2. Customize the UI to match your brand
3. Add additional features (profile update, password reset, etc.)
4. Deploy to App Stores (Android/iOS)

## 🔐 Security Notes

- Never commit `google-services.json` or `GoogleService-Info.plist`
- Add them to `.gitignore`
- Use Firebase Security Rules for database access
- Enable Email Verification for better security

## 📚 Resources

- [Firebase Flutter Documentation](https://firebase.flutter.dev/)
- [Flutter Authentication Best Practices](https://firebase.google.com/docs/auth/best-practices)
- [Flutter Material Design](https://material.io/design)

## 📧 Support

For issues with Firebase setup, refer to the [FlutterFire documentation](https://firebase.flutter.dev/docs/overview/).

---

**Happy Coding! 🎉**
