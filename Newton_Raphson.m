clear all;
clc;

% x = 2.352836323; % converges to 1
x = 2.35287527; % converges to 4
% x = 2.35284172; % converges to -3
x0 = x;
itermax = 100;
finalits = 30;
finits = itermax-(finalits-1);
for i=1:itermax
    f = x0^3-2*(x0^2)-11*x0+12;
    df = 3*(x0^2)-4*x0-11;
    xn = x0-f/df;
    x = [x xn];
    x0 = xn;
end 
plot(linspace(0,5,length(x)),x)
