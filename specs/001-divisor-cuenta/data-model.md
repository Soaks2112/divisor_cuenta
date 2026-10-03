# Data Model: Divisor de cuenta

## Cuenta

Representa la entrada del usuario.

| Campo | Tipo | Regla |
|---|---|---|
| monto | número | Debe ser numérico y no negativo. |
| personas | entero | Debe ser mayor que cero. |
| propina | número | Debe ser numérica y no negativa. |

## Resultado

Representa el importe por persona después de sumar la propina y aplicar una estrategia de
redondeo. Su valor se presenta con dos decimales.

## EstrategiaRedondeo

Contrato de un solo método para transformar el importe calculado por persona. Las
implementaciones son `RedondeoExacto` y `RedondeoHaciaArriba`.

## Relaciones

`CalcularDivision` recibe una `Cuenta` y una `EstrategiaRedondeo`, y devuelve un `Resultado`.
`ValidarEntrada` valida los datos antes de que se invoque `CalcularDivision`.
