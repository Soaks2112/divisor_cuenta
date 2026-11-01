# Deber 4 — De TDD a CI/CD

Estado: preparación local. Faltan ejecuciones y capturas reales de GitHub. Revisar y completar antes de entregar. Las respuestas anteriores se conservan en [respuestas_deber3.md](respuestas_deber3.md).

## 1. Workflow y pasos

Archivo: [ci.yml](.github/workflows/ci.yml).

```yaml
name: CI Flutter

on:
  push:
    branches: [main]
  pull_request:

permissions:
  contents: read

jobs:
  verificar:
    runs-on: ubuntu-latest
    steps:
      - name: Obtener el codigo
        uses: actions/checkout@v6
        with:
          persist-credentials: false
      - name: Preparar Flutter estable
        uses: subosito/flutter-action@v2
        with:
          channel: stable
      - name: Instalar dependencias
        run: flutter pub get
      - name: Analizar
        run: flutter analyze
      - name: Ejecutar pruebas
        run: flutter test
      - name: Compilar APK de depuracion
        run: flutter build apk --debug

  entrega:
    needs: verificar
    if: github.event_name == 'push' && github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - name: Obtener el codigo
        uses: actions/checkout@v6
        with:
          persist-credentials: false
      - name: Preparar Flutter estable
        uses: subosito/flutter-action@v2
        with:
          channel: stable
      - name: Instalar dependencias
        run: flutter pub get
      - name: Generar APK en este job
        run: flutter build apk --debug
      - name: Publicar APK como artifact
        uses: actions/upload-artifact@v7
        with:
          name: divisor-cuenta-debug
          path: build/app/outputs/flutter-apk/app-debug.apk
          if-no-files-found: error
```

- `analyze`: revisa el código y detecta errores estáticos y avisos del analizador.
- `test`: ejecuta las pruebas automáticas y falla si una expectativa no se cumple.
- `build`: compila la aplicación Android y genera el APK de depuración.

`checkout` obtiene el código; `flutter-action` instala Flutter estable; `pub get` resuelve dependencias. `entrega` espera a `verificar`, corre solo en push a `main`, prepara su propio entorno, recompila y publica el APK.

## 2. Fallo intencional

Pendiente: ejecutar la Parte 3 en GitHub y copiar aquí la línea real del log y su enlace. Caso elegido: `1. reparto normal`, en `test/casos_de_prueba.dart`; cambiar temporalmente 27.50 por 27.00. La comprobación está en `test/division_test.dart`: `expect(resultado.porPersona, closeTo(caso.esperado!, 0.001))`.

Captura pendiente: [✗ y log](evidencias/parte3_rojo.png). El fallo y su corrección deben quedar en el mismo PR. No atribuir a Actions una ejecución local.

## 3. CI, delivery y deployment

CI integra cambios y ejecuta verificaciones automáticas. Continuous delivery deja un entregable disponible después de aprobar esas verificaciones. Continuous deployment también lo despliega automáticamente a producción.

El workflow preparado implementa CI y una introducción a continuous delivery: publica un APK debug como artifact después de pasar CI en `main`. Su ejecución en GitHub está pendiente. No hay despliegue a producción.

## 4. Merge bloqueado

Captura pendiente: [merge bloqueado](evidencias/parte3_merge_bloqueado.png).

Exigir el check `verificar` y un pull request impide fusionar cambios con verificaciones fallidas. Aplicar también la regla a administradores, sin bypass, evita saltársela mediante push directo. La protección reduce el riesgo de romper `main` dentro de lo que las comprobaciones cubren.

## 5. Revisión crítica del agente

Acepté permisos `contents: read`, evitar que checkout conserve credenciales y `if-no-files-found: error`: la entrega debe fallar si falta el APK. No se agregaron secretos, despliegues ni paquetes en `pubspec.yaml`.

El agente señaló fragilidad por `ubuntu-latest`, Flutter estable y etiquetas de acciones que pueden cambiar. Fijar versiones y SHA completos mejoraría la reproducibilidad; se dejó como mejora futura para mantener Flutter estable según la consigna. Se descartó incorporar acciones adicionales de caché o despliegue porque no hacen falta para este deber.

`subosito/flutter-action` es de terceros: se consultó su repositorio y uso, lo que no equivale a auditar todo su código. Las demás acciones son de la organización `actions`. No se incluyeron nombres de paquetes o acciones sin comprobar su existencia.

Cada job tiene su propio entorno: `entrega` recompila en lugar de buscar el archivo del primer job. Esto consume más tiempo y, si cambian dependencias entre jobs, no asegura identidad binaria con el APK verificado. Transferir el APK original sería una mejora futura.

Referencias: [checkout](https://github.com/actions/checkout), [Flutter action](https://github.com/subosito/flutter-action), [upload-artifact](https://github.com/actions/upload-artifact), [condiciones de jobs](https://docs.github.com/en/actions/how-tos/write-workflows/choose-when-workflows-run/control-jobs-with-conditions).

## 6. Qué garantiza un CI verde

Que el código analizado, las pruebas incluidas y la compilación pasaron en el entorno de esa ejecución. No garantiza ausencia de errores ni calidad en todos los dispositivos. Por ejemplo, un botón podría quedar fuera de la pantalla en un teléfono pequeño y pasar estas pruebas, porque no se verifica ese tamaño de pantalla.

## 7. Qué detectó el pipeline que yo no había visto

Pendiente de completar después de leer el log real de Actions. Si solo aparece el fallo intencional, decirlo; no inventar errores adicionales descubiertos por CI.

Durante la preparación local, `flutter pub get` regeneró un `pubspec.lock` incompleto. Fue un hallazgo local, no un resultado del pipeline remoto. Localmente pasaron 12 pruebas y el analizador no encontró avisos.

## Evidencias y enlaces por completar

| Evidencia requerida | Archivo pendiente |
|---|---|
| CI inicial verde | [parte1_ci_verde.png](evidencias/parte1_ci_verde.png) |
| Protección de main (obligatoria) | [parte2_proteccion.png](evidencias/parte2_proteccion.png) |
| CI rojo y log | [parte3_rojo.png](evidencias/parte3_rojo.png) |
| Merge bloqueado | [parte3_merge_bloqueado.png](evidencias/parte3_merge_bloqueado.png) |
| Mismo PR corregido en verde | [parte3_verde_otra_vez.png](evidencias/parte3_verde_otra_vez.png) |
| Artifact de Actions (obligatoria) | [parte4_artifact.png](evidencias/parte4_artifact.png) |

- PR del pipeline inicial: pendiente.
- PR con historial rojo → verde: pendiente.
- PR de entrega automática: pendiente.
- Run de main con artifact descargado: pendiente.
- PR final deber4 → main: pendiente. Este será el único enlace que se entrega.
