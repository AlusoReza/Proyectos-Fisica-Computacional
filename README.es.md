<div align="right">
  <a href="README.md"><kbd><b>🇺🇸 English</b></kbd></a>
  <a href="README.es.md"><kbd><b>🇪🇸 Español</b></kbd></a>
</div>

# ⚛️ Proyectos de Física Computacional: Modelado y Simulación Numérica

Este repositorio contiene una colección de simulaciones numéricas de sistemas físicos complejos desarrolladas íntegramente en **Fortran 90**. El proyecto aborda problemas fundamentales en astrofísica, mecánica estadística y física cuántica que requieren métodos numéricos avanzados debido a la ausencia de soluciones analíticas exactas.

## 🚀 Resumen del Portafolio

El trabajo se estructura en cuatro módulos principales, cada uno diseñado para explorar una metodología de cálculo específica:

1.  **Dinámica de N-Cuerpos**: Simulación del Sistema Solar y colisiones de galaxias utilizando el **Algoritmo de Verlet** para garantizar la conservación de la energía a largo plazo.
2.  **Mecánica Estadística (Ising)**: Modelado de transiciones de fase ferromagnéticas mediante el **Algoritmo de Metropolis** y estudios de conservación de la magnetización con la **Dinámica de Kawasaki**.
3.  **Física Cuántica (Schrödinger)**: Resolución de la ecuación de Schrödinger dependiente del tiempo para paquetes de ondas y el **Oscilador Armónico Cuántico** mediante esquemas unitarios.
4.  **Mecánica Celeste**: Cálculo de trayectorias de naves espaciales en el sistema Tierra-Luna mediante un integrador **Runge-Kutta de 4º orden (RK4)**.

---

## 🛠️ Tecnologías y Herramientas

* **Lenguaje:** `Fortran 90` (Optimizado para computación científica de alto rendimiento).
* **Visualización:** `Gnuplot` (Generación de gráficas de datos, mapas de densidad y animaciones de trayectorias).
* **Entorno:** Compilación mediante `gfortran`.

---

## 📄 Documentación Científica

Los fundamentos teóricos, el análisis de errores y los resultados detallados están documentados en el informe científico incluido en este repositorio.
* **Formato**: LaTeX.
* **Contenido**: Deducciones de los esquemas numéricos, pruebas de convergencia y discusión de resultados físicos.

---

## 📝 Nota sobre Integridad Académica

Este repositorio ha sido publicado con fines informativos y como parte de mi portafolio profesional. El código aquí contenido es el resultado de mi trabajo personal en la asignatura de Física Computacional.

Si eres un estudiante que actualmente cursa esta materia o una similar:
* Te animo a utilizar este material como guía o referencia para entender los algoritmos.
* No se autoriza la copia literal o el plagio de estos archivos para entregas evaluables. 
* Recuerda que el aprendizaje real proviene de la resolución propia de los problemas y que la integridad académica es fundamental en nuestra formación como científicos.

---

## 🌌 Simulación de Dinámica Molecular: El Sistema Solar y Galaxias

Este módulo se centra en el estudio de la evolución de sistemas gravitatorios de $N$ cuerpos, desde la hipótesis nebular de la formación del Sistema Solar hasta la estabilidad orbital a largo plazo.

### 🛠️ Aspectos Técnicos e Implementación

* **Integrador Numérico**: Implementación del **Algoritmo de Velocidad de Verlet**. Este método de un paso se basa en el desarrollo de Taylor hasta orden $h^2$, siendo reversible y capaz de conservar en promedio la energía y el momento angular del sistema.
* **Optimización y Reescalamiento**: Para gestionar magnitudes extremas (como la masa solar o la constante $G$), se aplicó un reescalamiento de variables utilizando Unidades Astronómicas (AU) para la distancia y periodos de $\approx 58.1$ días como unidad temporal.
* **Modelado de Colisiones (Acreción)**: Simulación de la formación planetaria mediante choques totalmente inelásticos. El algoritmo gestiona la suma de masas y el crecimiento del radio resultante mediante la relación $R'_i = R_i[(m_i + m_j)/m_i]^{1/3}$.

### 🔬 Fenómenos Físicos Estudiados

* **Estabilidad de Órbitas**: Resolución de las ecuaciones del movimiento en 2D aprovechando la conservación del momento angular. Se analizaron diferentes trayectorias (elípticas, parabólicas e hiperbólicas) en función de la excentricidad $\epsilon$.
* **Evolución Estelar**: Simulación del impacto de los cambios de masa y radio del Sol en las órbitas planetarias, cubriendo desde la secuencia principal hasta la fase de enana blanca.
* **Dinámica de Galaxias**: Modelado de sistemas solares orbitando un agujero negro supermasivo central, analizando estados estacionarios y flujos de absorción de masa.

### 📈 Validación de Resultados
* Comprobación de la validez del modelo comparando los períodos de rotación simulados con los datos reales de los planetas del Sistema Solar.
* Seguimiento de la energía interna y calor disipado en los procesos de colisión para controlar los errores de redondeo numérico.

## 🧲 Mecánica Estadística: Modelo de Ising y Métodos de Monte Carlo

En este módulo se exploran las propiedades termodinámicas de sistemas de muchas partículas mediante simulación numérica, conectando la dinámica microscópica con observables macroscópicos como la magnetización.

### 🛠️ Aspectos Técnicos e Implementación

* **Método de Monte Carlo**: Uso del muestreo por importancia para calcular valores esperados en sistemas donde la integración analítica de la función de partición es inviable.
* **Algoritmo de Metropolis**: Implementación de una cadena de Markov para generar configuraciones de espines basadas en la condición de **balance detallado**. El algoritmo minimiza el rechazo de estados al proponer cambios locales (vuelcos de un solo espín) y aceptar movimientos según la probabilidad $P = \min(1, e^{-\beta \Delta E})$.
* **Dinámica de Redes**: Modelado de una red cuadrada bidimensional con **condiciones de contorno periódicas** para simular un sistema infinito y evitar efectos de borde.

### 🔬 Fenómenos Físicos Estudiados

* **Transiciones de Fase**: Observación del cambio de comportamiento entre el estado paramagnético (alta temperatura, magnetización nula) y el estado ferromagnético (baja temperatura, ordenamiento espontáneo).
* **Interacción de Canje**: Cálculo de la energía del sistema mediante un Hamiltoniano de vecinos próximos, donde la estabilidad de la configuración depende de la competición entre la energía interna y la entropía (temperatura).
* **Redes de Hopfield (Memoria Asociativa)**: Extensión del modelo para el estudio de redes neuronales, analizando la capacidad de recuperación de patrones (memoria) en función del "ruido" térmico y el solapamiento de patrones.

### 📈 Análisis y Observables
* **Magnetización Media**: Seguimiento del ordenamiento del sistema a través de la suma de espines por sitio.
* **Energía y Calor Específico**: Estudio de las fluctuaciones de energía para identificar el punto crítico de la transición de fase.
* **Recuperación de Memoria**: Cálculo de la fracción máxima de patrones almacenados que una red puede recordar sin error significativo (umbral de solapamiento $> 0.75$).

### 🧬 Extensión: Dinámica de Kawasaki (Conservación de la Magnetización)

Como parte avanzada del estudio del modelo de Ising, se implementó la **Dinámica de Kawasaki**, que introduce restricciones de conservación en el sistema.

* **Intercambio de Espines (Spin-Exchange)**: A diferencia de la dinámica de Glauber (donde los espines "vuelcan"), en este modelo se seleccionan pares de espines vecinos y se intercambian sus posiciones siguiendo el criterio de Metropolis. Esto simula sistemas donde el número de partículas de cada tipo es constante.
* **Conservación de la Magnetización**: La dinámica garantiza que la magnetización total $M$ sea una constante del movimiento, permitiendo observar la formación y evolución de dominios de fase segregados.
* **Transiciones de Fase Discontinuas**: Estudio de la coexistencia de fases para magnetizaciones iniciales no nulas ($m_0 \neq 0$), observando cómo el sistema se separa en regiones de distinta densidad de espines por debajo de la temperatura crítica.
* **Análisis de Susceptibilidad**: Cálculo de la susceptibilidad magnética $\chi_N$ a partir de las fluctuaciones de la magnetización por dominios, permitiendo realizar el escalado de tamaño finito para extrapolar la temperatura crítica en el límite termodinámico ($N \rightarrow \infty$).

## ⚛️ Mecánica Cuántica: Resolución de la Ecuación de Schrödinger

Este módulo aborda la evolución temporal de sistemas cuánticos unidimensionales mediante la resolución numérica de la ecuación de Schrödinger dependiente del tiempo.

### 🛠️ Aspectos Técnicos e Implementación

* **Esquema de Discretización**: Implementación de un algoritmo basado en el **operador de evolución temporal** $U(\Delta t) = e^{-iH\Delta t/\hbar}$. Se utilizó una aproximación de Cayley para garantizar la **unitariedad** del operador, asegurando que la norma de la función de onda (probabilidad total) se conserve constante en el tiempo.
* **Diferencias Finitas**: Uso de una malla espacial discretizada para aproximar el operador Hamiltoniano, transformando la ecuación en derivadas parciales en un sistema de ecuaciones lineales tridiagonales resoluble eficientemente.
* **Condiciones de Contorno**: Aplicación de condiciones de contorno rígidas (pozo de potencial infinito) y análisis de funciones de onda Gaussianas (paquetes de ondas).

### 🔬 Fenómenos Físicos Estudiados

* **Evolución de Paquetes de Ondas**: Simulación de la propagación de una partícula libre y dentro de pozos de potencial, observando fenómenos de dispersión y reflexión.
* **Valores Medios y Observables**: Cálculo computacional de valores esperados para la posición $\langle x \rangle$, el momento $\langle p \rangle$ y la energía $\langle H \rangle$ en cada paso temporal.
* **Principio de Incertidumbre**: Verificación numérica del principio de incertidumbre de Heisenberg mediante el seguimiento del producto de las desviaciones típicas $\Delta x \Delta p$ a lo largo de la simulación.

### 📈 Análisis de Resultados
* **Conservación de la Energía**: Validación del código mediante la comprobación de la estabilidad del valor medio del Hamiltoniano frente al tiempo.
* **Comparación Teórica**: Contraste de los resultados numéricos con las soluciones analíticas para autofunciones del Hamiltoniano, permitiendo medir la precisión del paso de tiempo $\Delta t$ y del espaciado $\Delta x$.

### 🌀 Extensión: El Oscilador Armónico Cuántico

En este bloque se aplicó el algoritmo de resolución de la ecuación de Schrödinger a un potencial cuadrático, permitiendo estudiar la dinámica de estados ligados y la transición al límite clásico.

* **Potencial Confinante**: Implementación de un potencial de tipo $V(x) = \frac{\omega^2}{4}(x - 0.5)^2$ en una malla discretizada de alta resolución ($S=1000$ puntos).
* **Análisis de Autofunciones**: Simulación de la evolución temporal de los primeros cuatro autovalores de la energía, verificando la estabilidad de las soluciones estacionarias.
* **Principio de Correspondencia de Bohr**: Estudio comparativo de la densidad de probabilidad cuántica $P(x, t) = |\phi(x, t)|^2$ frente a la distribución de probabilidad clásica. Se validó numéricamente cómo, para números cuánticos elevados ($n \ge 20$), el comportamiento cuántico converge hacia el límite clásico.
* **Paquetes de Ondas Gaussianos**: Simulación de estados no estacionarios mediante funciones de onda de amplitud Gaussiana, analizando la oscilación del valor medio de la posición y el momento en comparación con un oscilador armónico clásico de masa $m=1/2$.
* **Visualización Dinámica**: Generación de animaciones (GIFs) para observar la evolución de las partes real e imaginaria de la función de onda, así como la propagación y dispersión de la probabilidad.

## 🚀 Mecánica Celeste: El Problema Restringido de los Tres Cuerpos

Este módulo simula la trayectoria de una nave espacial en el sistema Tierra-Luna, abordando el reto de un sistema que no posee solución analítica general y que puede presentar comportamiento caótico.

### 🛠️ Aspectos Técnicos e Implementación

* **Integrador de Runge-Kutta (RK4)**: Implementación del algoritmo de Runge-Kutta de cuarto orden para resolver el sistema de ecuaciones diferenciales ordinarias (EDO) acopladas. Este método ofrece un equilibrio óptimo entre coste computacional y precisión (error de truncamiento de orden $h^4$).
* **Sistema de Referencia Rotante**: Transformación de las ecuaciones a un sistema de coordenadas que rota con la misma velocidad angular que el sistema Tierra-Luna. Esto permite simplificar el análisis al estudiar el movimiento de la nave respecto a los dos cuerpos masivos "fijos".
* **Adimensionalización**: Reescalamiento de las ecuaciones de movimiento utilizando la distancia Tierra-Luna y la masa total del sistema como unidades de medida, eliminando así la constante gravitatoria $G$ del cálculo numérico para mejorar la estabilidad.

### 🔬 Fenómenos Físicos Estudiados

* **Fuerzas Inerciales**: Incorporación de las aceleraciones de Coriolis y centrífuga derivadas del sistema de referencia no inercial.
* **Puntos de Lagrange**: Identificación y estudio de las zonas de equilibrio donde las fuerzas gravitatorias y las fuerzas inerciales se compensan.
* **Dinámica de Transferencia**: Simulación de trayectorias de inyección lunar, analizando la sensibilidad del sistema a las condiciones iniciales (posición y velocidad de impulso).

### 📈 Análisis y Estabilidad
* **Conservación de la constante de Jacobi**: Seguimiento de la cantidad conservada en el sistema restringido de tres cuerpos para validar la precisión del integrador numérico a lo largo del tiempo.
* **Control del Paso de Tiempo**: Evaluación del impacto del tamaño del paso $h$ en la acumulación de errores numéricos durante órbitas de larga duración.

