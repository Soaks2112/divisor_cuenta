# Feature Specification: Divisor de cuenta

**Feature Branch**: `001-divisor-cuenta`

**Created**: 2026-10-01

**Status**: Ready for planning

**Input**: User description: "Una app de una sola pantalla para dividir la cuenta de un restaurante entre varias personas. El usuario ingresa el monto total, el número de personas y el porcentaje de propina, y al tocar Calcular ve cuánto paga cada persona con dos decimales. Hay dos modos de redondeo: exacto o hacia arriba al entero más cercano. La app funciona sin conexión."

## User Scenarios & Testing

### User Story 1 - Calcular reparto de cuenta (Priority: P1)

Como persona que comparte una cuenta, quiero ingresar el total, el número de personas y
la propina para conocer cuánto paga cada una.

**Why this priority**: Es la necesidad principal y constituye el MVP completo.

**Independent Test**: Se ingresan valores válidos, se toca Calcular y se comprueba el
resultado mostrado por persona.

**Acceptance Scenarios**:

1. **Given** monto 100.00, 4 personas y 10% de propina en modo exacto, **When** se toca
   Calcular, **Then** se muestra 27.50 por persona.
2. **Given** monto 90.00, 3 personas y 0% de propina en modo exacto, **When** se toca
   Calcular, **Then** se muestra 30.00 por persona.

### User Story 2 - Elegir redondeo (Priority: P2)

Como persona que comparte una cuenta, quiero elegir cómo redondear el resultado para usar
la regla que necesito al repartir el pago.

**Why this priority**: Permite adaptar el resultado a dos prácticas comunes sin ampliar el
alcance del MVP.

**Independent Test**: Se calcula el mismo importe con cada modo y se comparan los valores
      mostrados.

**Acceptance Scenarios**:

1. **Given** monto 10.00, 3 personas y 0% de propina en modo exacto, **When** se toca
   Calcular, **Then** se muestra 3.33 por persona.
2. **Given** monto 10.00, 3 personas y 0% de propina en modo hacia arriba, **When** se
   toca Calcular, **Then** se muestra 4.00 por persona.

### User Story 3 - Informar entradas inválidas (Priority: P1)

Como usuario, quiero recibir un mensaje claro cuando los datos no se pueden usar para
calcular, para corregirlos sin recibir un resultado engañoso.

**Why this priority**: Evita divisiones inválidas y resultados que el usuario podría
interpretar como correctos.

**Independent Test**: Se envían entradas inválidas y se comprueba el mensaje y la ausencia
de resultado.

**Acceptance Scenarios**:

1. **Given** monto 50.00 y 0 personas, **When** se toca Calcular, **Then** se muestra
   "Debe haber al menos una persona" y no se muestra resultado.
2. **Given** el monto contiene "abc", **When** se toca Calcular, **Then** se muestra
   "Monto inválido" y no se muestra resultado.

### Edge Cases

- El número de personas debe ser un entero mayor que cero.
- El monto debe ser numérico y no negativo.
- La propina debe ser numérica y no negativa; si se omite, se interpreta como 0%.
- Los resultados visibles se muestran con dos decimales.
- La app no depende de red, cuentas, persistencia ni servicios externos.

## Requirements

### Functional Requirements

- **FR-001**: La app MUST permitir ingresar monto total, número de personas y porcentaje de propina.
- **FR-002**: La app MUST permitir seleccionar los modos de redondeo exacto y hacia arriba al entero más cercano.
- **FR-003**: La app MUST calcular el total con propina y dividirlo entre las personas válidas.
- **FR-004**: El modo exacto MUST redondear el resultado monetario a dos decimales.
- **FR-005**: El modo hacia arriba MUST redondear cada resultado al entero superior y mostrarlo con dos decimales.
- **FR-006**: La app MUST mostrar el importe por persona después de tocar Calcular con datos válidos.
- **FR-007**: La app MUST mostrar "Debe haber al menos una persona" cuando el número de personas sea cero o menor.
- **FR-008**: La app MUST mostrar "Monto inválido" cuando el monto no sea numérico.
- **FR-009**: La app MUST evitar mostrar un resultado cuando la validación falle.
- **FR-010**: La app MUST funcionar completamente sin conexión a internet y sin base de datos.

### Key Entities

- **Cuenta**: representa el monto total, el número de personas y el porcentaje de propina ingresados.
- **Resultado**: representa el importe calculado por persona y el modo de redondeo aplicado.
- **Estrategia de redondeo**: representa una regla intercambiable para obtener el importe por persona.

## Success Criteria

### Measurable Outcomes

- **SC-001**: Los seis escenarios de aceptación producen exactamente el resultado o mensaje esperado.
- **SC-002**: Un usuario puede completar un cálculo válido en una sola pantalla y en menos de un minuto.
- **SC-003**: El 100% de las entradas inválidas cubiertas por la especificación evita mostrar resultados.
- **SC-004**: La app puede ejecutar los seis cálculos sin red ni datos persistidos.
- **SC-005**: Cada criterio de aceptación tiene una prueba automatizada reproducible.

## Assumptions

- El usuario utiliza un dispositivo con Flutter disponible y puede leer los mensajes en español.
- El monto, la propina y el resultado usan unidades monetarias con dos decimales visibles.
- El modo exacto usa el redondeo monetario habitual a dos decimales; el modo hacia arriba usa el entero superior.
- El alcance se limita a una pantalla y no incluye historial, múltiples monedas, división desigual o almacenamiento.
