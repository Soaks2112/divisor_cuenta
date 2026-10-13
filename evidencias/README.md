# Evidencias del Deber 3

Las siete imágenes PNG son capturas de una vista HTML de los registros reales de los comandos. No son capturas de una terminal interactiva. Cada imagen tiene al lado su archivo TXT con la salida completa; solo se abrevia la ruta común del proyecto en la imagen para facilitar la lectura.

| Parte | Imagen | Resultado |
|---|---|---|
| 1 | `parte1_verde.png` | 10 pruebas iniciales pasan en `sdd`. |
| 2 | `parte2_rojo.png` | Falla la nueva prueba de propina 150; la de 100 pasa. |
| 3 | `parte3_verde.png` | Las 12 pruebas pasan con la validación mínima. |
| 4 | `parte4_analyze.png` | Avisos provocados temporalmente: variable sin usar y print. |
| 6 | `parte6_refactor.png` | Diff del refactor y 12 pruebas en verde. |
| 7 | `parte7_coverage.png` | Ejecución con cobertura y tabla por archivo. |
| 8 | `parte8_log.png` | Historial con commits rojo, verde y refactor. |

`parte4_limpio.txt` documenta la limpieza posterior a los avisos. No hay commit de linter: al retirar los ejemplos, no quedaron cambios, tal como permite la consigna. `estado_antes_refactor.txt` registra el árbol limpio previo al refactor. `analyze_final.txt` contiene la revisión final.

`cobertura.md` incluye todos los archivos de `lib/`, distinguiendo los que no aparecen en LCOV. La carpeta `coverage/` ya estaba ignorada mediante `/coverage/` en `.gitignore`; no se agrega al repositorio.

El historial de la parte 8 se capturó antes del commit final de evidencias y respuestas.
