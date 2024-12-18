clear; clc; close all

%% Plot
md = "final_sim_v3.slx";
out = sim(md);

f1 = figure(1);
f1.Position = [850 300 800 600];
plot(out.tspan, out.y_M, LineWidth=1.5)
grid on; grid minor
title("$y_M$ - time plot" , "interpreter", "latex", fontsize=12)
xlabel("$time$ [s]" , "interpreter", "latex", fontsize=12)
ylabel("$y_M$ [m]" , "interpreter", "latex", fontsize=12)

%% Parameters
r0 = 0.55;
l1 = out.l1(1);
l2 = out.l2(1);
l3 = out.l3(1);
theta_M = deg2rad(out.theta_M(1));
L_housing = 1;

%% Results
f2 = figure(2);
f2.Position = [50 300 800 600];
tspan = out.tspan; 
theta_m2_span = out.theta_m2;
theta_m3_span = out.theta_m3;

y_m2_span = out.y_m2;
y_M_span = out.y_M;

delta_l3_span = out.delta_l3;
delta_l2_span = out.delta_l2;

for k = 85:2:length(tspan)
    y_m2 = y_m2_span(k)+r0;
    y_M = y_M_span(k)+(l2+L_housing)*cos(theta_M)+r0;
    x_m2 = (y_M_span(k)-y_m2_span(k))*tan(theta_M);
    % x_m2 = 0;
    theta_m2 = theta_m2_span(k);
    theta_m3 = theta_m3_span(k);
    xLeft_l1  = x_m2 - l1*cos(theta_m2); 
    yLeft_l1  = y_m2 + l1*sin(theta_m2);
    xRight_l1 = x_m2 + l1*cos(theta_m2);
    yRight_l1 = y_m2 - l1*sin(theta_m2);

    % PLot Virtual GND
    plot([-2.5 2.5], [0 0], "--", LineWidth=1, Color="k")
    hold on

    % Plot l1
    plot([xLeft_l1, xRight_l1], [yLeft_l1, yRight_l1], "-o", MarkerSize=6, Linewidth=2, Color=[0.8500 0.3250 0.0980]); 
    hold on
    
    % Plot Tyre
    circle_ang = 0:0.01:2*pi;
    plot(x_m2+r0*cos(circle_ang), y_m2+r0*sin(circle_ang), LineWidth=2, Color=[0 0.4470 0.7410])
    hold on
    plot(xLeft_l1+r0*cos(circle_ang), yLeft_l1+r0*sin(circle_ang), LineWidth=2, Color=[0 0.4470 0.7410])
    hold on
    plot(xRight_l1+r0*cos(circle_ang), yRight_l1+r0*sin(circle_ang), LineWidth=2, Color=[0 0.4470 0.7410])
    hold on

    % Plot C5, K5 System
    plot([x_m2 (l2+L_housing)*sin(theta_M)], [y_m2 y_M], "-o", MarkerSize=6, LineWidth=2, Color=[0.8500 0.3250 0.0980])
    hold on
    plot([-0.5+(l2+L_housing)*sin(theta_M) 0.5+(l2+L_housing)*sin(theta_M)], [y_M+0.4 y_M+0.4], "-o", MarkerSize=10, LineWidth=2, Color=[0 0.4470 0.7410])
    hold on
    plot([-0.5+(l2+L_housing)*sin(theta_M) 0.5+(l2+L_housing)*sin(theta_M)], [y_M-0.4 y_M-0.4], "-o", MarkerSize=10, LineWidth=2, Color=[0 0.4470 0.7410])
    hold on
    plot([-0.5+(l2+L_housing)*sin(theta_M) -0.5+(l2+L_housing)*sin(theta_M)], [y_M-0.4 y_M+0.4], [0.5+(l2+L_housing)*sin(theta_M) 0.5+(l2+L_housing)*sin(theta_M)], [y_M-0.4 y_M+0.4], LineWidth=2, Color=[0 0.4470 0.7410])
    hold on
    plot([-0.6+(l2+L_housing)*sin(theta_M) -0.6+(l2+L_housing)*sin(theta_M)], [2 4], "--", [0.6+(l2+L_housing)*sin(theta_M) 0.6+(l2+L_housing)*sin(theta_M)], [2 4], "--", LineWidth=1, Color="k")
    hold on

    % Plot C4, K4 System
    delta_l2 = delta_l2_span(k);
    plot([xRight_l1 (l2+delta_l2)*sin(theta_M)], [yRight_l1 y_m2+(l2+delta_l2)*cos(theta_M)], "-o", MarkerSize=6, LineWidth=2, Color=[0.8500 0.3250 0.0980])
    hold off
    
    % Settings
    axis equal;
    axis([-3 3 -1 5]);
    grid on; grid minor
    xlabel("$x$ [m]", "interpreter", "latex", fontsize=12);
    ylabel("$y$ [m]", "interpreter", "latex", fontsize=12);
    text(-2.5, -0.2, "GND", "interpreter", "latex", fontsize=12);
    text((l2+L_housing)*sin(theta_M)-0.4, y_M+0.2, "M", "interpreter", "latex", fontsize=16, Color=[0 0.4470 0.7410]);
    text(xLeft_l1-0.3, yLeft_l1+0.3, "m1", "interpreter", "latex", fontsize=16, Color=[0 0.4470 0.7410]);
    text(x_m2-0.3, y_m2+0.3, "m2", "interpreter", "latex", fontsize=16, Color=[0 0.4470 0.7410]);
    text(xRight_l1, yRight_l1+0.3, "m3", "interpreter", "latex", fontsize=16, Color=[0 0.4470 0.7410]);
    drawnow

    % exportgraphics(gcf, "impulse_M30.gif", "Append", true)

end