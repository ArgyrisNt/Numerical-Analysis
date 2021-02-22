% Some examples of using Runge-Kutta method to solve an ODE

clear all;
clc;

%% 1st Example
h = 0.1;
f = @(x,y) (5*x^2-y)/exp(x+y);
yn = 1;
y = 1;
for x =0:h:10
    F1 = h*f(x,y);
    F2 = h*f(x+h/2,y+F1/2);
    F3 = h*f(x+h/2,y+F2/2);
    F4 = h*f(x+h,y+F3);
    y = y+(1/6)*(F1+2*F2+2*F3+F4);
    yn = [yn y];
end
plot(0:0.1:10,yn(1:end-1),'b')
grid on
hold on
% plot(0:0.1:10,yn(1:end-1),'r*')

%% 2nd Example
h = 0.01;
f = @(x,y) (x+y)*sin(x*y);
yn = 5;
y = 5;
for x =0:h:20
    F1 = h*f(x,y);
    F2 = h*f(x+h/2,y+F1/2);
    F3 = h*f(x+h/2,y+F2/2);
    F4 = h*f(x+h,y+F3);
    y = y+(1/6)*(F1+2*F2+2*F3+F4);
    yn = [yn y];
end
plot(0:0.01:20,yn(1:end-1),'b')
grid on