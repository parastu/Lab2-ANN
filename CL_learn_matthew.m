close all; clc; clear all;
% training data input


x_train=(0:0.1:2*pi)';
% training data target
y_train=sin(2*x_train) + normrnd(0.0, 0.3, size(x_train));

% number of centers
nb_centers=5;
%last unit center
max_step = 2*pi  - 0.05;
%step between 2 units
step = max_step / nb_centers;
%centers of the units
centers=(0.05:step:max_step);
%width of the centers
sigma=1.0;

centers_adjusted = centers;
rounds = 100000;
% initial maximum distance from included neighbors to winners
neighbor_distance = 0; %max_step/2;
% distance decreases linearly by this
neighbor_distance_step = neighbor_distance/rounds;
for i=1:rounds
    centers_adjusted = competitive_learning(centers_adjusted, datasample(x_train, 1), neighbor_distance, 0.2);
    neighbor_distance = neighbor_distance - neighbor_distance_step;
end
%Figure 2 plots the location of the centers. Green means initial centers,
%red means adjusted centers
figure(2);
clf;
plot(centers, 'g*');
hold on;
plot(centers_adjusted, 'r*');

W=least_squares_RBF(x_train,y_train,centers,sigma);
Y = predict_RBF(x_train,W,centers,sigma);
W2=least_squares_RBF(x_train,y_train,centers_adjusted,sigma);
Y2 = predict_RBF(x_train,W2,centers_adjusted,sigma);
figure(3);
hold on;
% vanilla error in green
plot(nb_centers, mean(abs(y_train-Y)), 'g.');
plot(nb_centers, mean(abs(y_train-Y2)), 'r.');

figure(1);
clf;
plot(x_train,Y);
hold on;
plot(x_train, y_train);
plot(x_train,Y2,'.');