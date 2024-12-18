clear; clc; close all;

load('10.mat');
load('20.mat');
load('30.mat');
load('40.mat');

f = figure();
f.Position = [850 300 800 400];
plot(time_10, y_M_10, 'LineWidth', 2);
hold on;
plot(time_20, y_M_20, 'LineWidth', 2);
hold on;
plot(time_30, y_M_30, 'LineWidth', 2);
hold on;
plot(time_40, y_M_40, 'LineWidth', 2);

xlabel('Time [sec]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
ylabel('$\Delta y$ [m]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
title('Comparsion of different $\theta_M$', 'FontWeight','bold' , 'FontSize', 20, 'Interpreter', 'latex');
Legend = legend('$\theta_M = 10^\circ$', '$\theta_M = 20^\circ$', '$\theta_M = 30^\circ$', '$\theta_M = 40^\circ$');
Legend.FontSize = 24;
Legend.Interpreter = 'latex';
grid on;
grid minor;
