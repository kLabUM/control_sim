# Simulation Module for Controlled Storm Water Systems 
---------------
MATLAB Simulink implementation of hydraulic and water quality models, for simulating local and system wide control in storm water elements such as ponds/wetlands.

![](https://github.com/kLabUM/control-sim-es-wrt/blob/master/g5087.png) 

## Getting Started
Requires ***MATLAB Simulink [R2016a](http://www.mathworks.com/products/matlab/whatsnew.html?s_tid=tb_16a)*** 

* *Flow_Pollutant_Timeseries.m* generates input runoff and nitrate concentrations for simulink models.
	* Model inputs are in the form of time-series and are loaded from the work-space.
	* Input block in simulink can be modified to use other formats, such as 1D-arrays. 
* Simulation's duration is set based on the storm window. It can be modified as per requirement 
* Fixed time step (ode 8) solver is set as the solver for simulations, they can be adjusted as per personal preference.
### Visualization
* *Local_Plots.m* and *Global_Plots.m* can used for generating a comprehensive visualization of the system. 
**NOTE** : Do not clear the work-space before running these scripts. Simulink exports the results (as arrays) back to work-space, from which the above script generates the plots.  

## Control
Controlled elements were assumed to fitted with a flow regulator at the outlet. Control in a isolated system can be implemented in the $Q_{out}$ module. 

Example:

    function Qout = Control(Height_Pond)
	    if Height_Pond <= 1.0
	        Qout=0;
	    else
	        Qout=2.0;
	    end

System wide control can implemented in a similar fashion with sight modification to the $Q_{out}$ module.  This implementation of system control, concedes the freedom of local controller to the system control module.

Example:

    function Qout = Control(Control_Height,Q_Control,Height_Pond)
        if Qoutc <= sqrt(2*9.81*Height_Pond)
            Qout = Qoutc;
        else
            Qout = sqrt(2*9.81*Height_Pond);
        end
    end

   System Control Module for a combination of controlled and uncontrolled ponds draining into a downstream wetland.  This control logic, ties to maximize the treatment capacity of downstream wetland during the wetlands, while simultaneously preventing the overflows in upstream ponds.

       function [Q1,Q2] = Controller(Wetland_Height,C1,C2,H1,H2,Q3)
        Volume=Wetland_Height*1000; 
        if Q3 > 0
            if Volume < 2000 
                Volume_Difference= 2000 - Volume;
                Temp1=Volume_Difference-Q3;
                if Temp1 > 0;
                    Q1=C1/(C1+C2)*Temp1; 
                    Q2=C2/(C1+C2)*Temp1;
                else
                    Q1=0;
                    Q2=0;
                end  
            else
                Q1=0;
                Q2=0;
            end
        else                % Maintains water level in controlled ponds 
            if H1 > 1.5 && H2 >0.80
                Q1=3*C1/(C1+C2);
                Q2=3*C2/(C1+C2);
            elseif H1 > 1.5 
                Q1=3;
                Q2=0;
            elseif H2 > 1
                Q2=3;
                Q1=0;
            else
                Q1=0;
                Q2=0;
            end
        end
        
These controllers have been implemented in the examples:

 - Local_control.slx  
 - Global_control.slx

## Hydraulics  and Water Quality Modules 
### Hydraulics 
Hydraulics in the elements were modeled based on pressure head.
### Water Quality 
Ponds and wetlands were assumed to behave as ideal CSTR's and a complete mass balance equation was used to describe the water quality response.
### Pollutants Modeled 
1. Total Suspended Solids 
2. Nitrate (Denitrification-pathway)
3. Ammonia (Nitrification-pathway)

Pollutant removal was modeled as first order process, with nitrification and denitrification dependent on the oxygen levels in the pond. Oxygen level is assumed to deplete when water enters the pond and reset once it becomes empty. This process is modeled as a first order process. 

> Developed using [Spacemacs](http://spacemacs.org/)
> Written with [StackEdit](https://stackedit.io/).
