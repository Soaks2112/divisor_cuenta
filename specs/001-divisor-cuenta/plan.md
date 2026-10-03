# Implementation Plan: Divisor de cuenta

**Branch**: `001-divisor-cuenta` | **Date**: 2026-10-01 | **Spec**: [spec.md](spec.md)

## Summary

Se construirá una app Flutter offline de una sola pantalla para calcular el importe por
persona. El dominio será Dart puro y estará separado de la interfaz mediante las capas
`presentation`, `domain` y `data`. El cálculo recibirá una estrategia de redondeo para
mantener SOLID y permitir futuras reglas sin editar el caso de uso.

## Technical Context

**Language/Version**: Dart con Flutter SDK estable

**Primary Dependencies**: Flutter SDK; sin paquetes externos

**Storage**: N/A; sin base de datos ni persistencia

**Testing**: `flutter test` y pruebas de widgets con `flutter_test`

**Target Platform**: Aplicación móvil Flutter; también debe analizar y probarse desde Windows

**Project Type**: Aplicación móvil de una sola pantalla

**Performance Goals**: Mostrar el resultado inmediatamente después de calcular; sin operaciones de red

**Constraints**: Offline, sin secretos, sin paquetes externos, dominio independiente de Flutter

**Scale/Scope**: Una pantalla, seis escenarios de aceptación, dos estrategias de redondeo

## Constitution Check

- **SOLID**: PASS. El cálculo, la validación, el formateo y la interfaz tendrán razones de cambio separadas.
- **Arquitectura**: PASS. Las dependencias seguirán `presentation -> domain <- data`.
- **Dominio puro**: PASS. `lib/domain/` no importará `package:flutter`.
- **Composición**: PASS. `main.dart` será el único punto que instancie implementaciones concretas.
- **Seguridad**: PASS. No se usarán secretos, red, base de datos ni servicios externos.
- **Pruebas**: PASS. Los seis escenarios y la pantalla tendrán pruebas ejecutables.
- **Explicabilidad**: PASS. Las clases y funciones tendrán nombres en español y responsabilidades acotadas.

## Project Structure

### Documentation

```text
specs/001-divisor-cuenta/
├── spec.md
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
└── tasks.md
```

### Source Code

```text
lib/
├── domain/
│   ├── cuenta.dart
│   ├── resultado.dart
│   ├── estrategia_redondeo.dart
│   ├── calcular_division.dart
│   └── validar_entrada.dart
├── data/
│   ├── redondeo_exacto.dart
│   └── redondeo_hacia_arriba.dart
├── presentation/
│   ├── divisor_controller.dart
│   ├── formateador_moneda.dart
│   └── pantalla_divisor.dart
└── main.dart

test/
├── casos_de_prueba.dart
├── division_test.dart
└── pantalla_test.dart
```

**Structure Decision**: Se elige un proyecto Flutter único con dominio Dart puro, datos
con implementaciones de estrategias y presentación Flutter. No se crean contratos externos
porque la app no expone APIs ni servicios.

## Complexity Tracking

No hay violaciones de la constitución que requieran justificar complejidad adicional.
