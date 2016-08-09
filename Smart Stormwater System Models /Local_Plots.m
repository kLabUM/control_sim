close all

%% Cumulative loads
control_load_cummilative=[];
control_load_cummilative_1=[];
nocontrol_load_cummilative=[];

control_load_cummilative(1)=Local_control_Load(1);
control_load_cummilative_1(1)=Local_nocontrol_Load_0(1);
nocontrol_load_cummilative(1)=Local_nocontrol_Load(1);
for i=2:length(Local_control_Load)
    control_load_cummilative(i)=control_load_cummilative(i-1)+Local_control_Load(i);
    nocontrol_load_cummilative(i)=nocontrol_load_cummilative(i-1)+Local_nocontrol_Load(i);
    control_load_cummilative_1(i)=control_load_cummilative_1(i-1)+Local_nocontrol_Load_0(i);
end

%% Color Pallet and plot dimentions 

ccontrol= [13 145 235] ./ 255;


c3 = [0 0 0]; % Axis
cpartial= c3;%[109 245 121] ./ 255;

units = 'centimeters'; % Units for plots height and width

width = 4; % Width of the plot 
height = 3; % Height of the plot 

Font = 'Helvetica';
Font_size = 7;

%% Plots

figure('Units',units,'Position',[20,15,7,20]);
%% Inflow and Nitrate
subplot(6,1,1); % Inflow 

t=0:minutes(5):minutes(2635);

plot(t,Runoff(1:length(t))*0.0004719474*100,'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
lim_x = datenum(t(length(t)));
xlim([0 lim_x])

ylabel('Inflow (m^{3}/s)') % Label for left

% Properties of plots
ax = gca;
ax.Units = units;
ax.XTick = [];
p1 = ax.Position;
ax.Position = [p1(1), p1(2), width, 2];

title('Local Control')

subplot(6,1,2) % Pollutant

plot(t,Nitrate(1:length(t)),'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ylabel('Inflow Nitrate (mg/l)') % Label for right

ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.YAxisLocation = 'right';
lim_x = datenum(t(length(t)));
xlim([0 lim_x])

% Properties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p1(2)-2, width, 2];
p2 = ax.Position;

%% Height and Discharge

subplot(6,1,3) % Height  

t=0:minutes(5):minutes(800*5-5);

plot(t,Local_control_Height(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Local_nocontrol_Height(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
plot(t,Local_nocontrol_Height_0(1:length(t)),'-','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.XTick = [];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 1.5])

ylabel('Height (m)') % Label for right


% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p2(2)-0.8-1.5, width, 1.5];
p3 = ax.Position;

subplot(6,1,4) % Discharge

t=0:minutes(5):minutes(800*5-5);

plot(t,Local_control_Discharge(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Local_nocontrol_Discharge(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
plot(t,Local_nocontrol_Discharge_O(1:length(t)),'-','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.YAxisLocation = 'right';
lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylabel('Outflow (m^{3}/s)') % Label for right

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p3(2)-2.5, width, 2.5];
p4 = ax.Position;

%% Concentration 
subplot(6,1,5) % Concentration

t=0:minutes(5):minutes(750*5-5);

plot(t,Local_control_Concentration(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Local_nocontrol_Concentration(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
plot(t,Local_nocontrol_Concentration_0(1:length(t)),'-','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size


lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylabel('Pond Nitrate (mg/l) ') % Label for right

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p4(2)-0.8-height, width, height];
p5 = ax.Position;

%% Total Loading

subplot(6,1,6) % Cummilative loads

t=0:minutes(5):minutes(800*5-5);

plot(t,(control_load_cummilative(1:length(t)))/1000,'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,(nocontrol_load_cummilative(1:length(t)))/1000,'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
plot(t,(control_load_cummilative_1(1:length(t)))/1000,'-','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

% Proerties of plots
ax = gca;
ax.Units = units;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size

ax.Position = [p5(1), p5(2)-0.8-height, width, height];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 9])
xlabel('Hours (HH:MM)') % Label for x
ylabel('Cumulative Load (kg)') % Label for right
legend('Controlled (Fully Drained)' , 'Uncontrolled','Controlled (Partially Drained)'...
    ,'Orientation','vertical')



