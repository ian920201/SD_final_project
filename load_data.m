clear; clc; close all;

model = 'final_sim_v3.slx';
load_system(model);
simOut = sim(model);

time_20 = simOut.tout;
theta_m2_20 = simOut.theta_m2.signals.values;
theta_m3_20 = simOut.theta_m3.signals.values;
y_m2_20 = simOut.y_m2.signals.values;
y_M_20 = simOut.y_M.signals.values;

save('20.mat', 'time_20', 'theta_m2_20', 'theta_m3_20', 'y_m2_20', 'y_M_20');