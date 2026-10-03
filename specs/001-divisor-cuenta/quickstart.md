# Quickstart: Divisor de cuenta

## Prerrequisitos

- Flutter funcionando.
- Git configurado.
- Proyecto abierto desde su raíz.

## Verificación

Desde la raíz del repositorio:

```powershell
flutter pub get
flutter test
flutter analyze
```

La ejecución debe terminar sin errores. Las pruebas deben cubrir los seis escenarios de
aceptación, la sustitución de ambas estrategias y los errores de la pantalla.

## Comprobación manual

1. Ejecuta `flutter run`.
2. Ingresa `100.00`, `4`, `10` y selecciona modo exacto.
3. Toca **Calcular** y comprueba `27.50`.
4. Prueba `50.00` y `0` personas; comprueba el mensaje de validación y la ausencia de resultado.
5. Prueba `abc` como monto; comprueba `Monto inválido`.
