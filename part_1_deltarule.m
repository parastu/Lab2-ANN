clc; close all;
clear all;
sinfunc = @(xx) sin(2*xx)

%determine the input
x = 0:1/10:2*pi;
x = x';
f = sinfunc(x);
%add gaussian noise to input signal
% f = f + 0.1*randn(size(f));

%plot(x,f)
% i define the points for the centers
xi = [0;pi/2; 2*pi/3; pi; 2*pi];
dist = 0.4;
%so, input is the x, xi is the centers
[ii,jj] = size(xi);
[kk,ll] = size(x);
[insize, ndata] = size(f);
for ss = 1:ii
   r = x(:,1) - xi(ss,1);
   rr(:,ss) = r;
end
   
phi = exp((-rr.^2)/2*dist);
phiphi = phi';
w = [0; 0; 0.5; -1; 0];
eta = 0.01;
err_val = 1000;
iter = 100;
des_val = 0.001;
% while err_val >0.0001
% while iter < 1000
for ii = 1:iter
    
for ss = 1:kk
    err_val;
    get_phi = phiphi(:,ss);
    err_val = sinfunc(x(kk,:)) - get_phi' * w ;
    temp_delta = -1*eta*err_val*get_phi;
    deltaw = temp_delta;
    w = w + deltaw;
% % %     out = phi*w;
% % %     errors = sqrt((1/insize)*sum((out - f).^2));
% % %     iter = iter + 1;
% % %     iter2(1,kk) = iter;
% % %     
%     if err_val > des_val
%         break 
%     end
% err_val

% err_val2(1,kk) = err_val;
end
funct = sinfunc(x);
error(ii) = mean(abs(funct - get_phi' * w));
end


plot(1:100,error)
% % % % % plot(x,f)
% % % % % hold on
% % % % % plot(x,phi*w)
% end
% plot(iter2, err_val2);

%% stop here!!

% phi_tr = phi'; %use this phi_tr and set random dots
% get_phi = phi_tr(:,5)
% %% delta w
% w = [0; 0; 0.5; -1; 0];
% iter = 0
% nio = 0.001;
% err_val = 1000;
% 
% while err_val > 0.001
% err_val = sinfunc(use_x) - (so_phi' * w);
% deltaw = -1*nio*err_val*so_phi;
% w_new = w + deltaw;
% w = w_new;
% iter = iter + 1
% err_val
% end
% 
% 
% 
% use_x = pi/3;
% phi = @(xx, yy, zz) exp((-(xx - yy)^2)/(2*(zz))) %xx = X val; yy = xi val; zz = dist val

%% algorithm to make the Phi values as (5x1)
% [ii,jj] = size(xi);

%this thing is to get Phi(xk)
% for ss = 1: ii
% vect_phi = phi(use_x, xi(ss,1), dist);
% so_phi(ss,:) = vect_phi;
% end
%trying to find delta w

%w = ((phi'*phi)^(-1))*phi'*f;
%w = randn(5,1);



% t_f = sin(2*xi);
% 
% tot_err2 = 10000;
% 
% 
% 
% 
% %phi_drule = 
% 
% err = (f-phi*w) %it should be f-phi'-w
% delta_w = nio*err'*phi %i change the err part, it shd be not transposed
% %while tot_err2 >0.1
    

%end

 %target is from the radial points
 %basis = f^(x) => targetnya berarti.. (t_f)
%sum of each column of phi*W = f(xk) or f(k)
%total error = ||phi*w - f||
%weight update = phiT * phi * w_new = phiT *f

%%next step: find the weight update algorithm!!


