# Instrucciones del proyecto

## Descripción

App Flutter de una sola pantalla para dividir una cuenta.

## Estructura

- `lib/presentation`: interfaz y estado de presentación.
- `lib/domain`: reglas de negocio y casos de uso.
- `lib/data`: implementaciones y acceso a datos.
- Dependencias permitidas: `presentation -> domain <- data`.
- `domain` no importa nada de `package:flutter`.

## Estándares

- Usar null safety.
- Usar nombres en español.
- No agregar paquetes externos.

## Límites

- No modificar `test/` sin que se solicite.
- No agregar dependencias al `pubspec.yaml` sin avisar.
- No tocar `android/` ni `ios/`.

## Comandos

- `flutter pub get`
- `flutter run`
- `flutter analyze`
- `flutter test`
