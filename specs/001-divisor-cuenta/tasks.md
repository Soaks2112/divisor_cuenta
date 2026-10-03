# Tasks: Divisor de cuenta

**Input**: Design documents from `specs/001-divisor-cuenta/`

## Phase 1: Setup

- [x] T001 Verify the Flutter project and Spec Kit artifacts in the repository root.
- [x] T002 Create the `lib/domain`, `lib/data`, and `lib/presentation` directories.

## Phase 2: Foundational

- [x] T003 [P] [US1] Create `lib/domain/cuenta.dart` and `lib/domain/resultado.dart` entities.
- [x] T004 [P] [US2] Create `lib/domain/estrategia_redondeo.dart` with one method.
- [x] T005 [P] [US3] Create `lib/domain/validar_entrada.dart` with the required validation messages.
- [x] T006 [US1] Create `lib/domain/calcular_division.dart` using the strategy abstraction.
- [x] T007 [P] [US2] Create `lib/data/redondeo_exacto.dart` and `lib/data/redondeo_hacia_arriba.dart`.

## Phase 3: User Story 1 - Calcular reparto (Priority: P1)

- [x] T008 [P] [US1] Create `test/casos_de_prueba.dart` with the six acceptance scenarios.
- [x] T009 [US1] Create `test/division_test.dart` to validate and execute every case.
- [x] T010 [US1] Create `lib/presentation/divisor_controller.dart` to coordinate validation and calculation.
- [x] T011 [P] [US1] Create `lib/presentation/formateador_moneda.dart` for two-decimal display.

## Phase 4: User Story 2 - Elegir redondeo (Priority: P2)

- [x] T012 [US2] Create `lib/presentation/pantalla_divisor.dart` with fields, mode selection and result.
- [x] T013 [US2] Compose concrete strategies only in `lib/main.dart`.
- [x] T014 [US2] Add the LSP test to `test/division_test.dart`.

## Phase 5: User Story 3 - Validar entradas (Priority: P1)

- [x] T015 [US3] Create `test/pantalla_test.dart` for valid, zero-person and non-numeric flows.
- [x] T016 [US3] Ensure invalid input clears the result and shows the exact required message.

## Phase 6: Polish and verification

- [x] T017 Run `flutter test` and fix implementation defects without changing tests.
- [x] T018 Run `flutter analyze` and verify all constitution checks with commands.
- [ ] T019 Run `flutter build apk --debug` and validate the quickstart scenarios.

## Dependencies and execution order

- T001-T002 precede all implementation.
- T003-T007 are foundational; T006 depends on T003-T005 and T007.
- T008-T011 can begin after the domain contracts exist.
- T012-T014 depend on the controller and strategy implementations.
- T015-T016 depend on the screen and controller.
- T017-T019 run after all stories are complete.
