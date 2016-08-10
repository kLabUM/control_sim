# Simulation Module for Controlled Storm Water Systems 

MATLAB Simulink implementation of hydraulic and water quality models, for simulating local and system wide control in storm water elements such as ponds/wetlands.

![Smart Water Network](https://github.com/kLabUM/control-sim-es-wrt/blob/master/g5087.png) 

## Getting Started
Requires ***MATLAB Simulink [R2016a](http://www.mathworks.com/products/matlab/whatsnew.html?s_tid=tb_16a)*** 
* *Flow_Pollutant_Timeseries.m* generates input runoff and pollutant timeseries for the simulink models.
	* Model inputs are in the form of timeseires and are loaded from the workspace directly. Modify the inputs in the input block to use inputs other formats, such as 1D-arrays. 
* Simulation durations are set based on the storm event in the repository and can be adjusted based on the event under analysis 
* Fixed time step solver (ode 8) is set as the solver for simulations, they can be adjusted as per personal perference  
* Local_Plots.m/Global_Plots.m can used for visualizing systems 
	- Do not clear the workspace before running these scripts. Simulink exports the results(as arrays) back to workspace for analysis 

## Model Refereces 

Add papers used 
