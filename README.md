# Simulation Module for Controlled Storm Water Systems 

MATLAB Simulink implementation of hydraulic and water quality models, for simulating local and system wide control in storm water elements such as ponds/wetlands.

## Getting Started
Requires MATLAB Simulink R2016a 

1. Run Flow_Pollutant_Timeseries.m to generate the inflow runoff and pollutant timeseries.
	- Model inputs are in the form of timeseires and are loaded from the workspace directly. Modify the inputs in the input block to use inputs in the form arrays.
2. Simulation durations are set based on the storm event in the repository and can be adjusted based on the event under analysis 
3. Fixed time step solver (ode 8) is set as the solver for simulations, they can be adjusted as per personal perference  
4. Local_Plots.m/Global_Plots.m can used for visualizing systems 
	- Do not clear the workspace before running these scripts. Simulink exports the results(as arrays) back to workspace for analysis 

## Model Refereces 

Add papers used 
