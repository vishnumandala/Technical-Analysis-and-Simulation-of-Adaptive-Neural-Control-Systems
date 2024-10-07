# Technical Analysis and Simulation of Adaptive Neural Control Systems
## ENPM667 - Control of Robotic Systems

## Team Members
- Vishnu Mandala: 119452608
- Rohit Sai Suresh: 119283684

## Software
- MATLAB R2023b

## Contents
- vishnu_rohit_report.pdf
- vishnu_rohit_presentation.pptx
- vishnu_rohit_readme.md
- DelayNN_s.m
- DelayNN.m
- Adaptive Neural Control (Original Paper).pdf

## Installation Instructions
1. Download the zip file
2. Install MATLAB

## Problem
The scripts simulate the results obtained in the paper 'Adaptive Neural Control For Non-Strict-Feedback Nonlinear Systems With Input Delay' and generate 4 graphs.

## Features
- The code calculates the control input u and its delayed version u(t−τ) to drive the system state towards the desired trajectory.
- The state errors (z1, z2, z3) and the control laws (α1, α2) are computed at each timestep.
- The adaptive law updates are computed for the neural network weights based on the state errors and the RBF neural network outputs.
- The system states and the control inputs are written to text files 'uDDNN.txt' and 'udDDNN.txt' for further analysis or visualization.
- The code is structured to handle initial transient behavior for t≤0.05 by setting the control input derivative ud to zero.

### Usage
1. Run the provided MATLAB script: DelayNN_s.m
2. The script will perform the simulation and display four graphs.
3. Uncomment lines 2 and 3 after the first run.

### Outputs

Figure 1  
![Figure 1](https://github.com/vishnumandala/Technical-Analysis-and-Simulation-of-Adaptive-Neural-Control-Systems/blob/main/figure1.jpg)

Figure 2  
![Figure 2](https://github.com/vishnumandala/Technical-Analysis-and-Simulation-of-Adaptive-Neural-Control-Systems/blob/main/figure2.jpg)

Figure 3  
![Figure 3](https://github.com/vishnumandala/Technical-Analysis-and-Simulation-of-Adaptive-Neural-Control-Systems/blob/main/figure3.jpg)

Figure 4  
![Figure 4](https://github.com/vishnumandala/Technical-Analysis-and-Simulation-of-Adaptive-Neural-Control-Systems/blob/main/figure4.jpg)

### Simulation
![](https://github.com/vishnumandala/Technical-Analysis-and-Simulation-of-Adaptive-Neural-Control-Systems/blob/main/simulation.gif)
