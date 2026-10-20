# Contador ascendente–descendente de 9 bits con signo (DE10-Lite)

Práctica 3 de Sistemas Embebidos, UDLAP. Contador de −256 a 255 en complemento a dos
controlado por una FSM (pausa / ascendente / descendente), con selector de velocidad
(1 s / 100 ms) y despliegue decimal con signo en HEX3–HEX0.

## Estructura
- `src/` — un archivo Verilog por módulo (entidad superior: `counter_9bit_top`).
- `docs/` — reporte (PDF y fuente LaTeX) y fotos/simulación del experimento.

## Módulos
| Módulo | Función |
|---|---|
| `button_onepulse` | Sincronizador de 2 FF + antirrebote (~10 ms) + pulso de un ciclo |
| `tick_generator` | Pulso de habilitación de 1 s o 100 ms desde el reloj de 50 MHz |
| `signed_counter_fsm` | FSM de 3 estados y contador de 9 bits con signo |
| `signed_display_9bit` | Magnitud decimal en HEX2–HEX0 y signo en HEX3 |
| `counter_9bit_top` | Integración y LEDs de estado |

## Asignación en la DE10-Lite
| Señal | Recurso |
|---|---|
| `CLOCK_50` | Reloj de 50 MHz |
| `BTN_RESET_N` | KEY0 |
| `BTN_PAUSE_N` | SW0 |
| `BTN_INC_N` | SW1 |
| `BTN_DEC_N` | SW2 |
| `SW_FREQ` | SW3 (0: 1 s, 1: 100 ms) |
| `LEDR[0..3]` | Pausa, ascendente, descendente, velocidad rápida |
| `LEDR[9]` | Signo (`count[8]`) |

Los números de pin se toman del manual de la DE10-Lite en Pin Planner.

## Uso
Crear un proyecto en Quartus Prime Lite para el dispositivo MAX 10 de la DE10-Lite,
agregar los archivos de `src/`, definir `counter_9bit_top` como entidad superior,
asignar pines, compilar y programar.

## Autores
Diego Camargo, Pablo Robles, Bruno García. Profesor: Gerardo Ulices Díaz.
