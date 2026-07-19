# Flutter Commands

## Install dependencies

flutter pub get

## Build Runner

fvm flutter pub run build_runner build --delete-conflicting-outputs
fvm flutter pub run build_runner watch --delete-conflicting-outputs

## Build APKs and App Bundles

flutter build apk --flavor production -t lib/f lavor/main_production.dart
flutter build appbundle --flavor production -t lib/flavor/main_production.dart
flutter build ios --flavor production -t lib/flavor/main_production.dart

## Localization

fvm dart run slang
fvm dart run slang watch

## Auto Route Generation

fvm dart run lean_builder clean && fvm dart run lean_builder build
fvm dart run lean_builder watch

# Flutter Assets Generation

fvm fluttergen -h

