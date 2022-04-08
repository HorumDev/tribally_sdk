# IOS only
android coming soon

# **Launch in-app feed with a few lines of code**

---

## **Integrate Tribally in under 30 min**

1. Sing up in [tribally web site](https://admin.tribally.app/signup)
2. Get your Application Keys
    - Create a new project
    - Head over to the Settings section and note the `Project ID`, `API Key`
3. Add Tribally Dependency
    - go to `pubspec.yaml`
    - add `tribally_sdk: ^0.0.4`

```dart
import 'package:tribally_sdk/tribally_sdk.dart';
```
---

## Configure TriballyView

Creating user and holding his unique uid on your side! So init TriballyView already with user UID and NAME.

```dart
TriballyView(
  uid: 'YOUR_USER_TOKEN',
  displayName: 'YOUR_USERNAME',
  apiKey: 'YOUR_APIKEY',
  projectId: 'YOUR_PROJECT_ID',
  avatar: 'YOUR_USER_AVATAR_URL'
)
```

---

# Advance use

If you want to implement your custom color scheme, use color Flutter colors:

```dart
//primary color
final Color? primary;

//background color
final Color? background;

//surface color(post backgrounds)
final Color? surface;

//text color
final Color? text;

//subText color
final Color? subText;

//icon color(optional)
final Color? icon;

//primary color for Dark Mode(optional)
final Color? primaryDark;
```

---

# Implementing Push Notifications

Please google how to implement push notifications in your app. This plugin allows you to set user's pushToken in the Tribally.
Simply call [onTriballyCreated] and

```dart
   onTriballyCreated: (TriballyController controller) {
   controller.setPushToken('pushToken');
   },
```

---

**Notes**

- Make sure you replace the `projectId` with your Tribally `projectId` and `apiKey` with your `apiKey` in the above code.
- As Tribally has support for adding photos, please add `Camera Usage Description` and `Photo Library Usage Description` to your `.plist` file.

**Issues**

Feel free to submit any issue [here](https://github.com/HorumDev/tribally_sdk/issues)