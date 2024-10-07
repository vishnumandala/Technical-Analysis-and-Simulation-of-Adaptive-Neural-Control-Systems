clc; clear all; close all;
% delete('uDDNN.txt');
% delete('udDDNN.txt');
lag = 0.05;
sol = dde23(@DelayNN, lag, [0.1;0.1;0.1;0;0;0;0;0;0], [0 20]);
figure(1)
plot(sol.x,sol.y(1:3,:));
grid on
legend('x_1','x_2','x_3')
figure(3)
plot(sol.x,sol.y(4:6,:));
grid on
legend('\theta_1','\theta_2','\theta_3')
figure(2)
plot(sol.x,sol.y(7:9,:));
grid on
legend('\lambda_1','\lambda_2','\lambda_3')
u = dlmread('uDDNN.txt');
ud = dlmread('udDDNN.txt');
figure(4);
plot(u);
grid on
hold on
plot(ud,':r');
legend('u','u_d_e_l_a_y')
