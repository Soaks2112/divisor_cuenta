# Bitácora — Deber 2

Fecha de trabajo: 2026-10-09, America/Guayaquil. Preparación asistida por Codex.

| Métrica | Flutter (laboratorio) | React (este deber) |
|---|---|---|
| Minutos hasta primera versión que compila | no registrado | 24.61 |
| Minutos hasta que pasan los 6 casos | no registrado | 24.64 |
| Iteraciones con el agente (mensajes de corrección del estudiante) | no registrado | 0 |
| Líneas de código escritas a mano por el estudiante | no registrado | 0 |
| Enunciados modificados en spec | — | 1 de 61 |
| Enunciados modificados en Constitution | — | 14 de 50: 12 adaptados y 2 reemplazados |
| Líneas modificadas en plan (métrica física) | — | +67 / -67 |
| Enunciados modificados en plan (métrica semántica) | — | 27 de 47 |
| Casos de aceptación que pasan | 6/6 comprobados ahora; sin dato histórico de tiempo | 6/6 |
| Suite completa | 10/10 | 25/25 |

## Medición

Inicio: 2026-10-10T02:34:19.571946+00:00 (UTC), al ejecutar setup-plan / flujo speckit-plan.
Primera compilación correcta: 2026-10-10T02:58:56.271090+00:00 (UTC).
Fin de los seis casos: 2026-10-10T02:58:57.896288+00:00 (UTC). Se detuvo ahí, no al terminar documentación.
Los registros UTC corresponden al 9 de octubre en Ecuador (UTC-5).
Evidencia: archivos en ../divisor_cuenta_web/evidencias/: inicio-plan.txt, primera-compilacion.txt y seis-casos-verdes.txt de evidencias/.
La preparación de herramientas/constitución previa no se incluye. La primera compilación se
midió sobre la aplicación implementada, no la pantalla de ejemplo de Vite.

El usuario delegó el trabajo con un único mensaje. Los comandos, correcciones internas y
consultas de herramientas de Codex no son iteraciones según la definición del deber.
No se inventan tiempos ni conteos históricos de Flutter. El tiempo React incluye elaboración
asistida de plan, tareas, pruebas e implementación; no permite inferir superioridad por sí solo.

## Flujo y límites

Spec Kit 1.0.13, misma integración Codex/skills que Flutter. Se ejecutó specify init,
no speckit-specify. Flujos constitution, plan, tasks, analyze, implement y converge se
realizaron leyendo sus SKILL.md y ejecutando scripts PowerShell de soporte; no se presentan
como binarios de shell inexistentes. Converge está disponible y se revisa al cerrar tareas.
No hay hooks de extensiones. SPECIFY_FEATURE_DIRECTORY se fijó en cada ejecución.

El análisis y casosDePrueba.js fueron generados por IA, aunque el deber pide trabajo manual:
requieren revisión personal del estudiante. La explicabilidad personal no puede certificarse
por el agente. La apertura offline por file:// no pudo probarse en el navegador integrado
por su política de URL; se verificó estructura autocontenida y sintaxis del bundle.
Los seis casos se probaron además en navegador HTTP local, con capturas móvil/escritorio.
No se ha publicado en GitHub: la solicitud fue preparar para subir; ambos repositorios
carecen de remoto propio configurado. El paquete contiene historia recuperable mediante bundles.
