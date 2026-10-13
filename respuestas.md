# Deber 3 — Respuestas

## 1. Rojo antes de verde

La prueba de monto 100, 4 personas y propina 150 mostró `Expected: 'La propina no puede superar el 100%'` y `Actual: <null>`. Falló porque todavía se aceptaba esa propina. Verla fallar confirmó que detectaba la regla que faltaba. La prueba de propina exactamente 100 sí pasó desde el inicio.

## 2. Linter vs. IA

El linter mostró `unused_local_variable` por una variable sin usar y `avoid_print` por `print('hola')`. Como el código estaba limpio, agregué esos ejemplos temporalmente y después los retiré, siguiendo la consigna. La IA señaló el número mágico `100` en la validación. El linter no lo marcó porque es código válido y las reglas configuradas no deciden si ese número necesita un nombre que explique su significado.

## 3. Tu refactorización

Elegí el número mágico del límite de propina. Lo convertí en la constante privada `_propinaMaxima` y la usé tanto en la comparación como en el mensaje. El límite sigue siendo 100 y el mensaje sigue siendo exactamente el mismo. Las 12 pruebas pasaron antes y después, sin modificarlas durante el refactor. Esto verifica los casos cubiertos, aunque no demuestra todos los casos posibles.

## 4. Coverage

Entre los archivos medidos en `coverage/lcov.info`, `lib/presentation/pantalla_divisor.dart` tiene el porcentaje más bajo: **97,50 %**, con 39 de 40 líneas cubiertas. No se ejecutó la línea 84, que maneja el cambio del selector de redondeo. Eso indica un caso sin probar, no necesariamente un error. `lib/main.dart` y la interfaz `lib/domain/estrategia_redondeo.dart` no aparecen en el informe: su cobertura no está medida y no se debe presentar como 100 %. La tabla completa está en `evidencias/cobertura.md`.
