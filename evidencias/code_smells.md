# Parte 5 — Revisión antes del refactor

Referencias al código del commit verde `6ad57ad`, antes de refactorizar.

| Archivo y línea | Code smell | Por qué dificulta mantenerlo |
|---|---|---|
| `lib/domain/validar_entrada.dart:14` y `:15` | Número mágico y límite repetido | El 100 representa una regla de negocio, pero no tiene nombre. La comparación y el mensaje podrían quedar desalineados si se cambia uno solo. |
| `lib/data/redondeo_exacto.dart:5` | Número mágico | El 100 representa los centavos por unidad; nombrarlo aclararía la intención del redondeo. |
| `lib/presentation/pantalla_divisor.dart:62`, `:68` y `:74` | Decoración repetida | Los campos repiten la construcción del borde. Un cambio visual requeriría revisar varias ubicaciones. Es una mejora opcional en una pantalla pequeña. |

**Elegido:** únicamente el número mágico del límite de propina en `ValidarEntrada`.

Se introdujo `static const int _propinaMaxima = 100` y se reutilizó en la comparación y en el mensaje. No se modificaron los otros candidatos ni las pruebas. El cálculo porcentual de `calcular_division.dart` conserva su 100: allí significa la base porcentual, no el máximo permitido.
