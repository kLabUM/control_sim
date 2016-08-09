close all
%% Settings 
ccontrol= [13 145 235] ./ 255;


c3 = [0 0 0]; % Axis
cpartial= c3;%[109 245 121] ./ 255;

units = 'centimeters'; % Units for plots height and width

width = 4; % Width of the plot 
height = 3; % Height of the plot 
spaceing_s = 1; %Spacing between plots
spaceing_v = 0.8; %Spacing Vertical
Font = 'Helvetica';
Font_size = 7;

figure('Units',units,'Position',[10,10,25,22]);

%% Inflow and Nitrate ------- POND 1

subplot(6,4,1); % Inflow 

t=0:minutes(5):minutes(800*5-5);

plot(t,Runoff(1:length(t))*0.0004719474*100,'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
lim_x = datenum(t(length(t)));
xlim([0 lim_x])
title('Pond 1')

ylabel('Inflow (m^{3}/s)') % Label for left


% Properties of plots
ax = gca;
ax.Units = units;
ax.XTick = [];
p1 = ax.Position;
p = p1; % Global location
ax.Position = [p1(1), p1(2), width, 2];

subplot(6,4,5) % Pollutant

plot(t,Nitrate(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ylabel('Inflow Nitrate (mg/s)') % Label for right

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

subplot(6,4,9) % Height  

t=0:minutes(5):minutes(800*5-5);

plot(t,Height_Pond1_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Height_Pond1_nocontrol(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
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
ax.Position = [p1(1), p2(2)-spaceing_v-1.5, width, 1.5];
p3 = ax.Position;

subplot(6,4,13) % Discharge

t=0:minutes(5):minutes(800*5-5);

plot(t,Qout_Pond1_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Qout_Pond1_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
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
subplot(6,4,17) % Concentration

t=0:minutes(5):minutes(800*5-5);

plot(t,Nitrate_Pond1_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Nitrate_Pond1_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
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
ax.Position = [p1(1), p4(2)-spaceing_v-height, width, height];
p5 = ax.Position;

%% Total Loading

subplot(6,4,21) % Cummilative loads

t=0:minutes(5):minutes(800*5-5);
Pond_control_load_cummilative=[];
Pond_nocontrol_load_cummilative=[];
Pond_control_load_cummilative(1)=Load_Pond1_control(1);
Pond_nocontrol_load_cummilative(1)=Load_Pond1_nocontrol(1);
for i=2:length(Load_Pond1_control)
    Pond_control_load_cummilative(i)=Pond_control_load_cummilative(i-1)+Load_Pond1_control(i);
    Pond_nocontrol_load_cummilative(i)=Pond_nocontrol_load_cummilative(i-1)+Load_Pond1_nocontrol(i);
end

plot(t,(Pond_control_load_cummilative(1:length(t)))/1000,'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,(Pond_nocontrol_load_cummilative(1:length(t)))/1000,'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

% Proerties of plots
ax = gca;
ax.Units = units;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size

ax.Position = [p5(1), p5(2)-spaceing_v-height, width, height];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 9])
ylabel('Cumulative Load (kg)') % Label for right
xlabel('Hours (HH:MM)')

%% Inflow and Nitrate ------- POND 2

subplot(6,4,2); % Inflow 

t=0:minutes(5):minutes(800*5-5);

plot(t,Runoff(1:length(t))*0.0004719474*100,'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
lim_x = datenum(t(length(t)));
xlim([0 lim_x])

title('Pond 2')

% Properties of plots
ax = gca;
ax.Units = units;
ax.XTick = [];
p1(1) = p1(1)+width+spaceing_s;
ax.Position = [p1(1), p1(2), width, 2];

subplot(6,4,6) % Pollutant

plot(t,Nitrate(1:length(t)),'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')


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

subplot(6,4,10) % Height  

t=0:minutes(5):minutes(800*5-5);

plot(t,Height_Pond2_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Height_Pond2_nocontrol(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.XTick = [];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 2])


% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p2(2)-spaceing_v-1.5, width, 1.5];
p3 = ax.Position;

subplot(6,4,14) % Discharge

t=0:minutes(5):minutes(800*5-5);

plot(t,Qout_Pond2_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Qout_Pond2_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.YAxisLocation = 'right';
lim_x = datenum(t(length(t)));
xlim([0 lim_x])

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p3(2)-2.5, width, 2.5];
p4 = ax.Position;

%% Concentration 
subplot(6,4,18) % Concentration

t=0:minutes(5):minutes(800*5-5);

plot(t,Nitrate_Pond2_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Nitrate_Pond2_noControl(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size


lim_x = datenum(t(length(t)));
xlim([0 lim_x])

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p4(2)-spaceing_v-height, width, height];
p5 = ax.Position;

%% Total Loading

subplot(6,4,24) % Cummilative loads

t=0:minutes(5):minutes(800*5-5);
Pond_control_load_cummilative=[];
Pond_nocontrol_load_cummilative=[];
Pond_control_load_cummilative(1)=Load_Pond2_control(1);
Pond_nocontrol_load_cummilative(1)=Load_Pond2_nocontrol(1);
for i=2:length(Load_Pond1_control)
    Pond_control_load_cummilative(i)=Pond_control_load_cummilative(i-1)+Load_Pond2_control(i);
    Pond_nocontrol_load_cummilative(i)=Pond_nocontrol_load_cummilative(i-1)+Load_Pond2_nocontrol(i);
end

plot(t,(Pond_control_load_cummilative(1:length(t)))/1000,'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,(Pond_nocontrol_load_cummilative(1:length(t)))/1000,'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

% Proerties of plots
ax = gca;
ax.Units = units;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size

ax.Position = [p5(1), p5(2)-spaceing_v-height, width, height];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 9])
xlabel('Hours (HH:MM)')

%% Inflow and Nitrate ------- POND 3

subplot(6,4,3); % Inflow 

t=0:minutes(5):minutes(800*5-5);

plot(t,Runoff(1:length(t))*0.0004719474*100,'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
lim_x = datenum(t(length(t)));
xlim([0 lim_x])


title('Pond 3') % Title

% Properties of plots
ax = gca;
ax.Units = units;
ax.XTick = [];
p1(1) = p1(1)+width+spaceing_s;
ax.Position = [p1(1), p1(2), width, 2];

subplot(6,4,7) % Pollutant

plot(t,Nitrate(1:length(t)),'-','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')

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

subplot(6,4,11) % Height  

t=0:minutes(5):minutes(800*5-5);

plot(t,Height_Pond3_nocontrol(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')


ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.XTick = [];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 2])

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p2(2)-spaceing_v-1.5, width, 1.5];
p3 = ax.Position;

subplot(6,4,15) % Discharge

t=0:minutes(5):minutes(800*5-5);

plot(t,Qout_Pond3_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')


ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.YAxisLocation = 'right';
lim_x = datenum(t(length(t)));
xlim([0 lim_x])


% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p3(2)-2.5, width, 2.5];
p4 = ax.Position;

%% Concentration 
subplot(6,4,19) % Concentration

t=0:minutes(5):minutes(800*5-5);


plot(t,Nitrate_Pond3_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')


ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size


lim_x = datenum(t(length(t)));
xlim([0 lim_x])


% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p4(2)-spaceing_v-height, width, height];
p5 = ax.Position;

%% Total Loading

subplot(6,4,23) % Cummilative loads

t=0:minutes(5):minutes(800*5-5);
Pond_control_load_cummilative=[];
Pond_nocontrol_load_cummilative=[];
Pond_control_load_cummilative(1)=Load_Pond3_control(1);
Pond_nocontrol_load_cummilative(1)=Load_Pond3_nocontrol(1);
for i=2:length(Load_Pond1_control)
    Pond_control_load_cummilative(i)=Pond_control_load_cummilative(i-1)+Load_Pond3_control(i);
    Pond_nocontrol_load_cummilative(i)=Pond_nocontrol_load_cummilative(i-1)+Load_Pond3_nocontrol(i);
end


plot(t,(Pond_nocontrol_load_cummilative(1:length(t)))/1000,'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')


% Proerties of plots
ax = gca;
ax.Units = units;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size

ax.Position = [p5(1), p5(2)-spaceing_v-height, width, height];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 9])
xlabel('Hours (HH:MM)')

%% Inflow and Nitrate ------- Wetland

subplot(6,4,4); % Inflow 

t=0:minutes(5):minutes(1200*5-5);

plot(t,Flow_NoContrik_in(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Flow_Control_in(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
ax = gca;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
lim_x = datenum(t(length(t)));
xlim([0 lim_x])

title('Wetland') % Title

% Properties of plots
ax = gca;
ax.Units = units;
ax.XTick = [];
p1(1) = p1(1)+width+spaceing_s;
ax.Position = [p1(1), p1(2), width, 2];

subplot(6,4,8) % Pollutant

plot(t,Nitrate_NoContrik_in1(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Nitrate_Control_in1(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')



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

subplot(6,4,12) % Height  

t=0:minutes(5):minutes(1200*5-5);

plot(t,Height_Catachment_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Height_Catchment_nocontrol(1:length(t)),'--','Color',c3,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.XTick = [];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([1 3.5])



% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p2(2)-spaceing_v-1.5, width, 1.5];
p3 = ax.Position;

subplot(6,4,16) % Discharge

t=0:minutes(5):minutes(1200*5-5);

plot(t,Flow_Catchment_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Flow_Catchment_nocontrol(1:length(t)),'-','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')

hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size
ax.YAxisLocation = 'right';
lim_x = datenum(t(length(t)));
xlim([0 lim_x])


% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p3(2)-2.5, width, 2.5];
p4 = ax.Position;

%% Concentration 
subplot(6,4,20) % Concentration

t=0:minutes(5):minutes(1200*5-5);

plot(t,Nitrate_Catchment_control(1:length(t)),'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,Nitrate_Catchment_nocontrol(1:length(t)),'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

ax = gca;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size


lim_x = datenum(t(length(t)));
xlim([0 lim_x])

% Proerties of plots
ax = gca;
ax.Units = units;
ax.Position = [p1(1), p4(2)-spaceing_v-height, width, height];
p5 = ax.Position;

%% Total Loading

subplot(6,4,24) % Cummilative loads

t=0:minutes(5):minutes(1200*5-5);
Pond_control_load_cummilative=[];
Pond_nocontrol_load_cummilative=[];
Pond_control_load_cummilative(1)=Load_Catchment_control(1);
Pond_nocontrol_load_cummilative(1)=Load_Catchment_nocontrol(1);
for i=2:length(Load_Pond1_control)
    Pond_control_load_cummilative(i)=Pond_control_load_cummilative(i-1)+Load_Catchment_control(i);
    Pond_nocontrol_load_cummilative(i)=Pond_nocontrol_load_cummilative(i-1)+Load_Catchment_nocontrol(i);
end

plot(t,(Pond_control_load_cummilative(1:length(t)))/1000,'-','Color',ccontrol,'LineWidth',2,'DurationTickFormat','hh:mm')
hold on
plot(t,(Pond_nocontrol_load_cummilative(1:length(t)))/1000,'--','Color',cpartial,'LineWidth',2,'DurationTickFormat','hh:mm')
hold off

% Proerties of plots
ax = gca;
ax.Units = units;
ax.YColor = c3;
ax.FontName = Font; % Font type
ax.FontSize = Font_size; % Font size

ax.Position = [p5(1), p5(2)-spaceing_v-height, width, height];

lim_x = datenum(t(length(t)));
xlim([0 lim_x])
ylim([0 20])


legend('Controlled (Fully Drained)' , 'Uncontrolled'...
    ,'Orientation','horizontal')
xlabel('Hours (HH:MM)')

