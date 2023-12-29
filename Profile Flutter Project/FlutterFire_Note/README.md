# flutterfire_note

Flutter Application Note | With Firebase Back-End.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


I am Ahmed Samy, a software engineer.

Notes that must be followed in order for the application to work normally:

------------
This package [url_launcher: ^6.0.20] require a {SDK 33}
Warning: The plugin url_launcher_android requires Android SDK version 33.
It must be changed in this path...  { android\app\build.gradle}
in
android {
compileSdkVersion 33 // for url_launcher_android
}

------------
This package [cloud_firestore]  The minimum minSdkVersion is 19.
It must be changed in this path...  { android\app\build.gradle}
in
android {
defaultConfig {
minSdkVersion 19 // for cloud_firestore
multiDexEnabled true // And add this line
}
}


------------
Regarding Firebase services
In your project on Firebase Console :

1- The service must be activated [Firebase Authentication]
Then activate {Sign-in method} Such as  <Email/Password>

2- The service must be activated [Firebase Cloud Firestore]
Then give reading and writing powers by changing the {Rules}
    We will give read and write powers only if there is listening to the data 
        (that is, if there is already a user {meaning there is a person who has logged in}), 
        and this is to keep the application safe from hackers and hackers 
        (and also because it is possible for a hacker or bad person to Flooding the application with a 
        very large number of unimportant readings and writings, which will lead to a very high Firebase bill).
rules_version = '2';
service cloud.firestore {
match /databases/{database}/documents {
match /{document=**} {
allow read, write: if request.auth != null; 
}
}
}


------------
