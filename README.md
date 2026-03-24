<div align="right">
  <a href="README.md"><kbd><b>🇺🇸 English</b></kbd></a>
  <a href="README.es.md"><kbd><b>🇪🇸 Español</b></kbd></a>
</div>

# ⚛️ Computational Physics Projects: Numerical Modeling & Simulation

This repository contains a collection of numerical simulations of complex physical systems developed entirely in **Fortran 90**. The project addresses fundamental problems in astrophysics, statistical mechanics, and quantum mechanics that require advanced numerical methods due to the absence of exact analytical solutions.

## 🚀 Portfolio Overview

The work is structured into four main modules, each designed to explore a specific calculation methodology:

1. **N-Body Dynamics**: Simulation of the Solar System and galactic collisions using the **Verlet Algorithm** to ensure long-term energy conservation.
2. **Statistical Mechanics (Ising)**: Modeling of ferromagnetic phase transitions using the **Metropolis Algorithm** and studies on magnetization conservation with **Kawasaki Dynamics**.
3. **Quantum Physics (Schrödinger)**: Resolution of the time-dependent Schrödinger equation for wave packets and the **Quantum Harmonic Oscillator** using unitary schemes.
4. **Celestial Mechanics**: Calculation of spacecraft trajectories in the Earth-Moon system using a **4th-order Runge-Kutta (RK4)** integrator.

---

## 🛠️ Technologies and Tools

* **Language:** `Fortran 90` (Optimized for high-performance scientific computing).
* **Visualization:** `Gnuplot` (Generation of data plots, density maps, and trajectory animations).
* **Environment:** Compilation via `gfortran`.

---

## 📄 Scientific Documentation

The theoretical foundations, error analysis, and detailed results are documented in the scientific report included in this repository.
* **Format**: LaTeX.
* **Content**: Derivations of numerical schemes, convergence tests, and discussion of physical results.

---

## 📝 Academic Integrity Note

This repository has been published for informational purposes and as part of my professional portfolio. The code contained herein is the result of my personal work in the Computational Physics course.

If you are a student currently enrolled in this or a similar course:
* I encourage you to use this material as a guide or reference to understand the algorithms.
* Literal copying or plagiarism of these files for evaluable assignments is not authorized.
* Remember that real learning comes from solving problems yourself and that academic integrity is fundamental in our training as scientists.

---

## 🌌 Molecular Dynamics Simulation: The Solar System and Galaxies

This module focuses on the study of the evolution of $N$-body gravitational systems, from the nebular hypothesis of Solar System formation to long-term orbital stability.

### 🛠️ Technical Aspects and Implementation

* **Numerical Integrator**: Implementation of the **Velocity Verlet Algorithm**. This one-step method is based on a Taylor expansion up to order $h^2$, being reversible and capable of conserving the system's energy and angular momentum on average.
* **Optimization and Rescaling**: To manage extreme magnitudes (such as the solar mass or the constant $G$), a variable rescaling was applied using Astronomical Units (AU) for distance and periods of $\approx 58.1$ days as the temporal unit.
* **Collision Modeling (Accretion)**: Simulation of planetary formation through totally inelastic collisions. The algorithm manages the sum of masses and the resulting radius growth using the relation $R'_i = R_i[(m_i + m_j)/m_i]^{1/3}$.

### 🔬 Physical Phenomena Studied

* **Orbital Stability**: Resolution of the equations of motion in 2D, taking advantage of angular momentum conservation. Different trajectories (elliptical, parabolic, and hyperbolic) were analyzed based on eccentricity $\epsilon$.
* **Stellar Evolution**: Simulation of the impact of solar mass and radius changes on planetary orbits, covering from the main sequence to the white dwarf phase.
* **Galaxy Dynamics**: Modeling of solar systems orbiting a central supermassive black hole, analyzing steady states and mass absorption flows.

### 📈 Result Validation
* Checking model validity by comparing simulated rotation periods with real data from Solar System planets.
* Monitoring internal energy and dissipated heat in collision processes to control numerical rounding errors.

## 🧲 Statistical Mechanics: Ising Model and Monte Carlo Methods

In this module, the thermodynamic properties of many-particle systems are explored through numerical simulation, connecting microscopic dynamics with macroscopic observables such as magnetization.

### 🛠️ Technical Aspects and Implementation

* **Monte Carlo Method**: Use of importance sampling to calculate expected values in systems where analytical integration of the partition function is unfeasible.
* **Metropolis Algorithm**: Implementation of a Markov chain to generate spin configurations based on the **detailed balance** condition. The algorithm minimizes state rejection by proposing local changes (single spin flips) and accepting moves according to the probability $P = \min(1, e^{-\beta \Delta E})$.
* **Lattice Dynamics**: Modeling of a two-dimensional square lattice with **periodic boundary conditions** to simulate an infinite system and avoid edge effects.

### 🔬 Physical Phenomena Studied

* **Phase Transitions**: Observation of behavior changes between the paramagnetic state (high temperature, zero magnetization) and the ferromagnetic state (low temperature, spontaneous ordering).
* **Exchange Interaction**: Calculation of system energy using a nearest-neighbor Hamiltonian, where configuration stability depends on the competition between internal energy and entropy (temperature).
* **Hopfield Networks (Associative Memory)**: Extension of the model for the study of neural networks, analyzing pattern recovery capacity (memory) as a function of thermal "noise" and pattern overlap.

### 📈 Analysis and Observables
* **Mean Magnetization**: Monitoring system ordering through the sum of spins per site.
* **Energy and Specific Heat**: Study of energy fluctuations to identify the critical point of the phase transition.
* **Memory Recovery**: Calculation of the maximum fraction of stored patterns that a network can remember without significant error (overlap threshold $> 0.75$).

### 🧬 Extension: Kawasaki Dynamics (Magnetization Conservation)

As an advanced part of the Ising model study, **Kawasaki Dynamics** was implemented, introducing conservation constraints into the system.

* **Spin-Exchange**: Unlike Glauber dynamics (where spins "flip"), this model selects pairs of neighboring spins and exchanges their positions following the Metropolis criterion. This simulates systems where the number of particles of each type remains constant.
* **Magnetization Conservation**: The dynamics guarantee that total magnetization $M$ is a constant of motion, allowing for the observation of the formation and evolution of segregated phase domains.
* **Discontinuous Phase Transitions**: Study of phase coexistence for non-zero initial magnetizations ($m_0 \neq 0$), observing how the system separates into regions of different spin density below the critical temperature.
* **Susceptibility Analysis**: Calculation of magnetic susceptibility $\chi_N$ from magnetization fluctuations across domains, enabling finite-size scaling to extrapolate the critical temperature in the thermodynamic limit ($N \rightarrow \infty$).

## ⚛️ Quantum Mechanics: Solving the Schrödinger Equation

This module addresses the temporal evolution of one-dimensional quantum systems through the numerical resolution of the time-dependent Schrödinger equation.

### 🛠️ Technical Aspects and Implementation

* **Discretization Scheme**: Implementation of an algorithm based on the **time evolution operator** $U(\Delta t) = e^{-iH\Delta t/\hbar}$. A Cayley approximation was used to guarantee the **unitarity** of the operator, ensuring that the wave function norm (total probability) remains constant over time.
* **Finite Differences**: Use of a discretized spatial grid to approximate the Hamiltonian operator, transforming the partial differential equation into an efficiently solvable tridiagonal linear equation system.
* **Boundary Conditions**: Application of rigid boundary conditions (infinite potential well) and analysis of Gaussian wave functions (wave packets).

### 🔬 Physical Phenomena Studied

* **Wave Packet Evolution**: Simulation of propagation for a free particle and inside potential wells, observing scattering and reflection phenomena.
* **Expectation Values and Observables**: Computational calculation of expected values for position $\langle x \rangle$, momentum $\langle p \rangle$, and energy $\langle H \rangle$ at each time step.
* **Uncertainty Principle**: Numerical verification of the Heisenberg uncertainty principle by tracking the product of standard deviations $\Delta x \Delta p$ throughout the simulation.

### 📈 Result Analysis
* **Energy Conservation**: Validation of the code by checking the stability of the mean Hamiltonian value over time.
* **Theoretical Comparison**: Contrast of numerical results with analytical solutions for Hamiltonian eigenfunctions, allowing for measurement of time step $\Delta t$ and spacing $\Delta x$ precision.

### 🌀 Extension: The Quantum Harmonic Oscillator

In this block, the Schrödinger equation resolution algorithm was applied to a quadratic potential, allowing the study of bound state dynamics and the transition to the classical limit.

* **Confining Potential**: Implementation of a $V(x) = \frac{\omega^2}{4}(x - 0.5)^2$ type potential on a high-resolution discretized grid ($S=1000$ points).
* **Eigenfunction Analysis**: Simulation of the temporal evolution of the first four energy eigenvalues, verifying the stability of stationary solutions.
* **Bohr Correspondence Principle**: Comparative study of quantum probability density $P(x, t) = |\phi(x, t)|^2$ versus classical probability distribution. It was numerically validated how, for high quantum numbers ($n \ge 20$), quantum behavior converges toward the classical limit.
* **Gaussian Wave Packets**: Simulation of non-stationary states using Gaussian amplitude wave functions, analyzing the oscillation of mean position and momentum values compared to a classical harmonic oscillator of mass $m=1/2$.
* **Dynamic Visualization**: Generation of animations (GIFs) to observe the evolution of the real and imaginary parts of the wave function, as well as probability propagation and dispersion.

## 🚀 Celestial Mechanics: The Restricted Three-Body Problem

This module simulates the trajectory of a spacecraft in the Earth-Moon system, addressing the challenge of a system that lacks a general analytical solution and can exhibit chaotic behavior.

### 🛠️ Technical Aspects and Implementation

* **Runge-Kutta Integrator (RK4)**: Implementation of the fourth-order Runge-Kutta algorithm to solve the system of coupled ordinary differential equations (ODE). This method offers an optimal balance between computational cost and precision ($h^4$ order truncation error).
* **Rotating Reference Frame**: Transformation of the equations to a coordinate system that rotates with the same angular velocity as the Earth-Moon system. This simplifies analysis by studying the spacecraft's motion relative to the two "fixed" massive bodies.
* **Nondimensionalization**: Rescaling of motion equations using the Earth-Moon distance and total system mass as measurement units, thus eliminating the gravitational constant $G$ from numerical calculation to improve stability.

### 🔬 Physical Phenomena Studied

* **Inertial Forces**: Incorporation of Coriolis and centrifugal accelerations derived from the non-inertial reference frame.
* **Lagrange Points**: Identification and study of equilibrium zones where gravitational and inertial forces balance each other.
* **Transfer Dynamics**: Simulation of lunar injection trajectories, analyzing system sensitivity to initial conditions (position and impulse velocity).

### 📈 Analysis and Stability
* **Jacobi Constant Conservation**: Monitoring the conserved quantity in the restricted three-body system to validate numerical integrator precision over time.
* **Time Step Control**: Evaluation of the impact of step size $h$ on the accumulation of numerical errors during long-duration orbits.
