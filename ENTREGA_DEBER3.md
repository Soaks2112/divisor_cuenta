# Entrega — Deber 3

Rama local: `deber3`, creada desde `sdd`.

## Contenido

- Regla: propina superior a 100 devuelve `La propina no puede superar el 100%`. La pantalla usa el error del controlador y no muestra un resultado.
- Dos pruebas nuevas con monto 100 y 4 personas: propinas 150 y 100.
- Commits separados de rojo, verde y refactor.
- Cuatro respuestas en `respuestas.md`.
- Siete imágenes y sus registros en `evidencias/`.
- Cobertura: 66/67 líneas medidas (98,51 %); detalle y archivos no medidos en `evidencias/cobertura.md`.

## Verificación

```powershell
flutter test
flutter analyze
flutter test --coverage
git log --oneline
```

Se verificaron 12 pruebas en verde y el analizador sin avisos. Las imágenes muestran los registros de ejecución, como se explica en `evidencias/README.md`.

## Subir la rama a GitHub

La entrega está preparada localmente; la publicación queda pendiente. Desde esta carpeta:

```powershell
git push -u origin deber3
```

Después del push, el enlace para entregar es:

https://github.com/Soaks2112/divisor_cuenta/tree/deber3

Antes de subir a la plataforma de clase, revisar las respuestas y comprobar que la rama se abre en GitHub. No entregar únicamente un ZIP como reemplazo de la rama: la consigna solicita el historial de commits en GitHub.
