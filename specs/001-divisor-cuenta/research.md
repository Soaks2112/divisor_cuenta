# Research: Divisor de cuenta

## Decision: Flutter SDK estable sin paquetes externos

La app usa el SDK estable de Flutter y Dart puro para el dominio. No necesita red, base de
datos ni paquetes externos porque el alcance es una sola pantalla offline.

**Rationale**: Reduce superficie de cambio y permite que las pruebas de dominio sean
independientes de Flutter.

**Alternatives considered**: Un gestor de estado externo y una base de datos local fueron
descartados porque agregan complejidad sin aportar valor al MVP.

## Decision: Estado local con `setState`

El estado de los campos, el mensaje de validación y el resultado permanecen en la pantalla.

**Rationale**: Hay una sola pantalla y no existe estado compartido entre rutas.

**Alternatives considered**: BLoC, Provider y Riverpod fueron descartados para mantener el
alcance y la cantidad de dependencias mínimos.

## Decision: Estrategia de redondeo como abstracción

El cálculo recibe una interfaz de estrategia. Las implementaciones exacta y hacia arriba
se mantienen separadas.

**Rationale**: Cumple OCP, LSP, ISP y DIP; una tercera regla puede incorporarse como otra
implementación sin modificar el cálculo existente.

**Alternatives considered**: Un `if` dentro del cálculo fue descartado porque acopla el
caso de uso a cada regla concreta.
