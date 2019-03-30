clc; close all;
clear all;

%determine the input
x = 0:1/10:2*pi;
test_x = 0.5:1/10:2*pi;
test_x = test_x';
x = x';
f = sin(2*x);
ftest = sin(2*test_x);

% i define the points for the centers

xi = [0;pi/17; pi/9; 2*pi/6; 2*pi/8; pi/2]; %change dimension and values!!
dist = 0.4;
%so, input is the x, xi is the centers

%% part of getting phi values into 62x5 matrice
[ii,jj] = size(xi);

for ss = 1:ii
   r = x(:,1) - xi(ss,1);
   rr(:,ss) = r;
end
   
phi = exp((-rr.^2)/2*dist);
%% part of getting the W and the least square error

t_f = sin(2*xi);


w = ((phi'*phi)^(-1))*phi'*f; %initialisation of W

err_mat = phi*w - f;
[errsizex, errsizey] = size(err_mat);
err_xx = 1:1:errsizex;

tot_err = (norm(phi*w - f))
tot_err2 = tot_err^2


figure(1)
plot(x, err_mat)
title(sprintf('Error values: %s',tot_err2))
xlabel('0 < x < 2*pi')
ylabel('Error value')


figure(2)
plot(x, f)
title('Function: Sin(2*X)')
hold on
plot(x, phi*w)
legend('Target', 'Testing');
xlabel('0 < x < 2*pi')
ylabel('sine values')

 %target is from the radial points
 %basis = f^(x) => targetnya berarti.. (t_f)
%sum of each column of phi*W = f(xk) or f(k)
%total error = ||phi*w - f||
%weight update = phiT * phi * w_new = phiT *f

%%next step: find the weight update algorithm!!


