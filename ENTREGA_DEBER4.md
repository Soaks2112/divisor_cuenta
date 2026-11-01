# Deber 4 — Preparación y subida

## Estado real

Proyecto: `Participacion7/divisor_cuenta`, repositorio público https://github.com/Soaks2112/divisor_cuenta.

Se prepararon tres ramas locales, sin publicar:

| Rama | Contenido |
|---|---|
| `ci/primer-pipeline` | Workflow inicial: pub get → analyze → test → build debug; lockfile regenerado. |
| `ci/entrega` | Agrega entrega dependiente de CI y publicación del APK solo en push a main. |
| `deber4` | Respuestas, revisión crítica, instrucciones y lista de capturas pendientes. |

Base: `deber3` (ya existe en GitHub). El remoto no tenía `main` al preparar esta entrega; su rama predeterminada era `sdd`. La `main` local es anterior al Deber 3, por lo que NO se usa como base de los cambios. No se modificó el código de la app ni las pruebas. No se cambió Android ni iOS.

Verificación local: Flutter 3.47.5 / Dart 3.13.4, 12 pruebas aprobadas y analizador sin avisos. El APK local y su estado se documentan en `evidencias/verificacion_deber4.md`.

Esto todavía no es una entrega completa: faltan los PR, las ejecuciones de Actions, la protección y seis capturas reales. No subir solo el ZIP a la plataforma: se pide el enlace del PR final.

## 0. Preparar main con el proyecto existente

Desde la carpeta del divisor, con los cambios guardados:

```powershell
git fetch origin
git push origin sdd:main
```

Este primer push crea la rama remota que falta a partir de la base existente. No sobreescribe una main remota: si ya existe, detenerse y revisar antes de continuar. En GitHub, abrir https://github.com/Soaks2112/divisor_cuenta/compare/main...deber3 y fusionar el Deber 3 por PR. Cambiar la rama predeterminada del repositorio a `main` en Settings. No usar `--force`.

## 1. Subir el pipeline inicial

```powershell
git switch ci/primer-pipeline
git push -u origin ci/primer-pipeline
```

Abrir https://github.com/Soaks2112/divisor_cuenta/compare/main...ci/primer-pipeline. Leer completo el workflow. Esperar a que `verificar` pase sus cuatro comandos en Actions. Si falla por entorno, resolver ese fallo antes de seguir. Guardar `evidencias/parte1_ci_verde.png` (en un lugar temporal fuera del checkout si vas a cambiar de rama) y fusionar el PR.

## 2. Proteger main

En Settings → Branches, crear una regla para `main`:

- Require a pull request before merging.
- Require status checks to pass before merging: seleccionar `verificar`.
- Activar la aplicación de las reglas a administradores / Do not allow bypassing the above settings. No añadir excepciones de push ni bypass.

No exigir una aprobación de otra persona si trabajas solo: el deber pide PR y CI. Guardar la regla y tomar `parte2_proteccion.png`. Comprobar en la regla guardada que el push directo no tiene excepción. Los pasos siguientes siempre usan PR.

## 3. Crear el PR rojo y corregir el mismo PR

Se usa `origin/main` para no depender de la main local antigua:

```powershell
git fetch origin
git switch -c ci/rojo-a-proposito origin/main
```

Editar SOLO el primer caso de `test/casos_de_prueba.dart`: cambiar `esperado: 27.50` por `esperado: 27.00`.

```powershell
git add test/casos_de_prueba.dart
git commit -m "test: fallo intencional para ver el pipeline en rojo"
git push -u origin ci/rojo-a-proposito
```

Abrir https://github.com/Soaks2112/divisor_cuenta/compare/main...ci/rojo-a-proposito. Esperar el fallo de `verificar`. Leer el paso Ejecutar pruebas y copiar la línea real del error en la respuesta 2. Capturar `parte3_rojo.png` y `parte3_merge_bloqueado.png` ANTES de corregir. El PR debe mostrar la fusión bloqueada; si permite fusionar, revisar la protección.

Restaurar `esperado: 27.50` en ese mismo archivo y en la misma rama:

```powershell
git add test/casos_de_prueba.dart
git commit -m "test: restaurar resultado correcto de reparto normal"
git push
```

Esperar el verde, capturar `parte3_verde_otra_vez.png`, anotar el enlace del PR y fusionarlo. No cerrar y crear otro PR para la corrección.

## 4. Entregar el artifact

```powershell
git fetch origin
git switch ci/entrega
git rebase origin/main
git push -u origin ci/entrega
```

La rama ya contiene el cambio preparado; el rebase incorpora las fusiones anteriores. Si Git muestra conflicto, resolverlo antes de subir, sin forzar el push. Abrir https://github.com/Soaks2112/divisor_cuenta/compare/main...ci/entrega.

En este PR `verificar` debe pasar y `entrega` debe quedar omitido: es correcto porque aún no es push a `main`. Fusionar el PR y abrir la nueva ejecución de `main` en Actions. Ahora deben pasar ambos jobs. Descargar `divisor-cuenta-debug`, abrir el ZIP y verificar `app-debug.apk`. Guardar `parte4_artifact.png` mostrando la sección Artifacts del run. Una compilación local no sustituye esta evidencia.

## 5. Publicar respuestas y capturas

```powershell
git fetch origin
git switch deber4
git rebase origin/main
```

Copiar a `evidencias/` las seis capturas con los nombres de `evidencias/DEBER4.md`. Completar las respuestas 2 y 7 y los enlaces a los PR y al run del artifact en `respuestas.md`. Revisar las respuestas con tus palabras. Eliminar las marcas de pendiente solo cuando exista la evidencia correspondiente. Conservar la copia de respuestas del Deber 3.

```powershell
git add respuestas.md evidencias/
git commit -m "deber4: completar respuestas y evidencias de GitHub"
git push -u origin deber4
```

Abrir https://github.com/Soaks2112/divisor_cuenta/compare/main...deber4, con título `Deber 4: CI/CD, respuestas y evidencias`, y dejar el PR abierto. Confirmar el check verde y que las imágenes se abren desde `respuestas.md`.

Entregar únicamente la URL real de ese PR, que tendrá la forma `https://github.com/Soaks2112/divisor_cuenta/pull/NUMERO`. No entregar el enlace de comparación ni uno inventado.

## Lista final

- [ ] Proyecto y workflow fusionados a main por PR.
- [ ] Repositorio público y main predeterminada.
- [ ] Protección guardada y check verificar obligatorio, sin bypass.
- [ ] Un mismo PR tiene fallo y corrección, con merge bloqueado capturado.
- [ ] Entrega solo después del CI exitoso y solo en main.
- [ ] Artifact descargado y captura guardada.
- [ ] Seis PNG reales enlazados y visibles.
- [ ] Preguntas 1–7 revisadas y sin pendientes.
- [ ] PR deber4 abierto hacia main y en verde.
- [ ] Se entrega solo el enlace de ese PR.
