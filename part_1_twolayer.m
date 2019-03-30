clc, clear all, close all;

%setting up the patterns as 0 - 2pi
x = 0:1/10:2*pi;
patterns = x;
targets = sin(2*patterns);
%isfunct = funct*100
% [size1,size2] = size(isfunct);
%targets = [];

% for iii = 1 : size1
%     if funct(iii,1) < 0
%        targets(iii,1) = - 1;
%     else
%         targets(iii,1) = 1;
%     end
%     
% end


[insize, ndata] = size(patterns);
[outsize, ndata] = size(targets);


%backprop

X = [patterns; ones(1, ndata)];
alpha = 0.9;

hidden = 7;
w = randn(hidden, insize+1);
v = randn(1, hidden+1);
dw = 0;
dv = 0;

eta = 0.001;
error = [];
rmse = [];
steps = 0:10000;

%Phi declaration:
phi = @(xxx) (2./(1+exp(-xxx)))-1;

%Phi prime:
phiprime = @(yyy) ((1+yyy).*(1-yyy))/2;

epoch = 0;
for i = steps
    % Forward pass
    hin = w * [patterns; ones(1, ndata)]; %ini W*X
    hout = [phi(hin); ones(1, ndata)];

    oin = v * hout;
    out = phi(oin);

    % Backward pass
    delta_o = (out - targets) .* phiprime(out);
    delta_h = (v' * delta_o) .* phiprime(hout);
    delta_h = delta_h(1:hidden, :);

    % Weight update
    dw = (dw .* alpha) - (delta_h * X') .* (1 - alpha);
    dv = (dv .* alpha) - (delta_o * hout') .* (1 - alpha);
    w = w + dw .* eta;
    v = v + dv .* eta;
    
    %drawing
    % Show
      %only w
   
%     error = out - targets;
%     errors = append(error);
     errors = sqrt((1/insize)*sum((out - targets).^2));
%     errors = norm(out - targets);
     error = [error; errors];
%      error = [error; sum(sum(abs(sign(out) - sign(targets)) ./2))];
%     [errsize,errsize2] = error;
%     rmse = [rmse; 1/errsize * (out - targets)]; 
end
figure;
 plot(x,targets)
hold on
plot(x, out)  

 figure(2);
 plot(steps, error);
