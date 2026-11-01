# Deber 3 — Respuestas

## 1. Rojo antes de verde

La prueba esperaba el mensaje **«La propina no puede superar el 100%»**, pero recibió `null`, es decir, ningún error. Era importante verla fallar porque así comprobé que la prueba detectaba el problema antes de corregirlo.

## 2. Linter vs. IA

El linter me avisó que había una variable sin usar. La puse a propósito porque al inicio no había avisos, y luego la borré. La IA señaló el **100** usado directamente como límite de propina. El linter no lo encontró porque ese número no rompe ninguna regla; simplemente cuesta más entender qué significa.

## 3. Tu refactorización

Elegí ese **100** sin nombre. Le di el nombre «propina máxima» y usé ese valor para revisar la propina y mostrar el mensaje. La regla sigue siendo la misma. Lo comprobé porque las **12 pruebas pasaron** antes y después del cambio.

## 4. Coverage

De los archivos que aparecen en el informe, **`pantalla_divisor.dart`** tiene el porcentaje más bajo: **97,5 %**. Eso no significa que tenga un error; significa que hay una parte de la pantalla que las pruebas todavía no usaron.
