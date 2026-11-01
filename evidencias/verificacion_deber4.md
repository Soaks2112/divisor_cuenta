# Verificación local del Deber 4

Fecha: 1 de noviembre de 2026, America/Guayaquil.

- Flutter 3.47.5 estable, Dart 3.13.4.
- `flutter pub get`: correcto; regeneró un lockfile anterior incompleto. No se modificó pubspec.yaml ni se añadieron dependencias a la app.
- `flutter analyze`: No issues found (51.3 s).
- `flutter test`: All tests passed, 12 pruebas.
- `flutter build apk --debug`: correcto; Built build/app/outputs/flutter-apk/app-debug.apk (Gradle 249.8 s).
- Revisión estática del workflow: comandos en orden, dependencia needs, restricción a push en main, ruta del APK y copia exacta del YAML en respuestas.
- `git diff --check`: sin errores de espacios.

Este archivo es un resumen de resultados observados localmente, no una transcripción completa ni evidencia de Actions. El APK local no reemplaza el artifact que debe publicar GitHub. Las evidencias posteriores de GitHub se encuentran en [el índice de capturas](DEBER4.md).

APK: 175334159 bytes.
SHA256: 3FD6D47EF4B917415B7A3BEBA6EE3806A4374D0DC9075919B94F298EAA987DA4
