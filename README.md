[![App Store](https://img.shields.io/badge/%20-App%20Store-red?style=for-the-badge&logo=app-store&color=%232196F3&logoColor=white)](https://www.lunasea.app/appstore)
[![Play Store](https://img.shields.io/badge/%20-Play%20Store-red?style=for-the-badge&logo=google-play&color=%234CAF50&logoColor=white)](https://www.lunasea.app/playstore)
[![Codemagic Build Status](https://img.shields.io/badge/%20-Codemagic-red?style=for-the-badge&logo=circleci&color=%2332323E&logoColor=white)](https://codemagic.io/apps/5ef3424e03ad6b478a268d4c/5ef3424e03ad6b478a268d4b/latest_build)
[![Subreddit](https://img.shields.io/reddit/subreddit-subscribers/LunaSeaApp?label=%20&logo=reddit&color=%23F44336&logoColor=white&style=for-the-badge)](https://www.lunasea.app/reddit)
[![Discord](https://img.shields.io/discord/673591529834807358?color=7289da&label=%20&logo=discord&logoColor=white&style=for-the-badge)](https://www.lunasea.app/discord)
![LunaSea](https://uploads-ssl.webflow.com/5fcfe91dceef944b8c203a63/5fd4d46b86a0830f10cad146_lunasea_splash_2.png)

LunaSea is a fully featured, open source self-hosted controller! Focused on giving you a seamless experience between all of your self-hosted media software, LunaSea supports:

- Lidarr
- Radarr
- Sonarr
- NZBGet
- SABnzbd
- Newznab Indexer Searching
- NZBHydra2
- Tautulli
- Wake on LAN

LunaSea even comes with support for multiple instances of applications using profiles, backing up and restoring your configuration to your filesystem, an AMOLED black theme, and more!

> Please note that LunaSea is purely a remote control application, it does not offer any functionality without software installed on a server/computer.

---

## Developing, Installing, &amp; Building (iOS)

#### Requirements

1. A MacOS Machine
2. An AppleID account (does not require developer account)
3. [Flutter Framework (Stable Channel)](https://flutter.dev/)
4. [XCode](https://apps.apple.com/ca/app/xcode/id497799835?mt=12)
5. [Developer Certificate Configured](https://github.com/LunaSeaApp/LunaSea/wiki/Setup-of-Development-Certificate)
6. [FlutterFire for IOS Configured](https://firebase.flutter.dev/docs/installation/ios/)

#### Developing

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Start your simulator or plug in your device and ensure you have accepted it is a trusted device
4. Install LunaSea in development mode on your device or simulator
    - `flutter run` 

#### Installing

> Release builds can only be installed on physical devices

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Plug in your device and ensure you have accepted it is a trusted device
4. Install a production version of the application on your device
    - `flutter run --release`

#### Building (.ipa)

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Run `build_ipa` inside of the `scripts` folder
4. The IPA will be placed in the root of the project directory

---

## Developing, Installing, &amp; Building (Android)

#### Requirements

1. [Android SDK/Android Studio Installed & Configured](https://developer.android.com/studio)
2. [Flutter Framework (Stable Channel)](https://flutter.dev/)
3. [Keystore Configured](https://github.com/LunaSeaApp/LunaSea/wiki/Configure-Keystore)
4. [FlutterFire for Android Configured](https://firebase.flutter.dev/docs/installation/android/)

#### Developing

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Start your simulator or plug in your device and ensure you have enabled USB Debugging
4. Install LunaSea in development mode on your device or simulator
    - `flutter run` 

#### Installing

> Release builds can only be installed on physical devices

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Plug in your device and ensure you have enabled USB Debugging
4. Install a production version of the application on your device
    - `flutter run --release`

#### Building (.apk)

1. Clone the repository
    - `git clone git@github.com:LunaSeaApp/LunaSea.git`
2. Install the Flutter packages
    - `flutter pub get`
3. Run `build_apk` inside of the `scripts` folder
4. The APKs will be placed in the root of the project directory
    - ARM 32-bit: `LunaSea-armeabi-v7a-release.apk`
    - ARM 64-bit: `LunaSea-arm64-v8a-release.apk`
    - x86 64-bit: `LunaSea-x86_64-release.apk`
