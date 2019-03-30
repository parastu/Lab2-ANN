% function [ W, res] = delta_rule_RBF( X, F, centers, sigma, nb_epochs, eta )
%UNTITLED5 Compute the weigths according to the delta rule approach
%   Detailed explanation goes here
% phi_compute;
clc; clear all; close all;
X = 0:1/10:2*pi;
X = X';
F = sin(2*X);
centers = [0;pi/17; pi/9; 2*pi/6; 2*pi/8; pi/2];
sigma = 0.4;
nb_epochs = 1000;
eta = 0.01;

nb_units = length(centers);   %n in the assignment
nb_obs = size(X,1);         %N in the assignment
phi= zeros(nb_obs,nb_units);
for ii = 1:nb_units
    phi(:,ii)=exp(-(X-centers(ii)).^2/(2*sigma^2));
end


% phi = phi_compute(X, centers, sigma);
nb_units = length(centers);
nb_obs = length(X);
W = normrnd(0.0,1.0,nb_units,1);   %initialization
error = zeros(1,nb_epochs);
for ii = 1:nb_epochs
    data=[X F phi];
    data=data(randperm(size(data,1)),:);   %randomly shuffle the data
    X=data(:,1);
    F = data(:, 2);
    phi = data(:, 3:end);
    for kk =1:nb_obs
        delta_W = eta * (F(kk) - phi(kk,:)*W) * phi(kk,:)';
        W = W + delta_W;
    end
    error(ii) = mean(abs(F - phi*W));
end
% XX = 0:1/10:2*pi;
% XX = XX';
% FF = sin(2*X);
% 
% figure(1)
% plot(X,FF)
% hold on
% plot(X, phi*W)
 figure(2)
% hold on
 plot(error) %(uncomment to plot the error)
 

% end