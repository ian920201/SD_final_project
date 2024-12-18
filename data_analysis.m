clear; clc; close all;

% sim
model = 'final_sim_v4';
load_system(model);

simOut = sim(model);
time = simOut.tout;
theta_m2 = simOut.theta_m2.signals.values;
theta_m3 = simOut.theta_m3.signals.values;
y_m2 = simOut.y_m2.signals.values;
y_M = simOut.y_M.signals.values;

% plot
figure1 = figure(1);
figure1.Position = [850 300 800 400];
plot(time, theta_m2, 'LineWidth', 2);
hold on;
plot(time, theta_m3, 'LineWidth', 2);
xlabel('Time [sec]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
ylabel('Degree [deg]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
title('Values of $\theta$ ($\theta_M = 50^\circ$)', 'FontWeight','bold' ,'FontSize', 20, 'Interpreter', 'latex');
Legend = legend('$\theta_{m2}$', '$\theta_{m3}$');
Legend.FontSize = 24;
Legend.Interpreter = 'latex';
grid on;
grid minor;

figure2 = figure(2);
figure2.Position = [850 300 800 400];
plot(time, y_m2, 'LineWidth', 2);
hold on;
plot(time, y_M, 'LineWidth', 2);
xlabel('Time [sec]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
ylabel('$\Delta y$ [m]', 'FontWeight', 'bold', 'FontSize', 20, 'Interpreter', 'latex');
title('Vibration of Aircraft ($\theta_M = 50^\circ$)', 'FontWeight','bold' , 'FontSize', 20, 'Interpreter', 'latex');
Legend = legend('$y_{m2}$', '$y_{M}$');
Legend.FontSize = 24;
Legend.Interpreter = 'latex';
grid on;
grid minor;

% save .mat
time_50 = time;
theta_m2_50 = theta_m2;
theta_m3_50 = theta_m3;
y_m2_50 = y_m2;
y_M_50 = y_M;
save('50.mat', 'time_50', 'theta_m2_50', 'theta_m3_50', 'y_m2_50', 'y_M_50');