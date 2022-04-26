clc
clear all

%f = @(x) [2*x(1)-cos(x(2)); sin(x(1))+2*x(2)];
%jac = @(x) [2 sin(x(2)); cos(x(1)) 2];

f = @(x) [x(1)^2 + x(2)^2 - 9; x(1) + x(2) - 3];
jac = @(x) [2*x(1) 2*x(2); 1 1];

int = 4;
xx = [-int:0.5:int];
yy = [-int:0.5:int];

[X, Y] = meshgrid(xx, yy);
%Z1 = 2 * X - cos(Y);
%Z2 = sin(X) + 2 * Y;
Z1 = X.^2 + Y.^2 - 9;
Z2 = X + Y - 3;

figure
mesh(X, Y, Z1);
hold on
contour(X, Y, Z1, [0,0], 'r-', 'linewidth', 2)

figure
mesh(X, Y, Z2);
hold on
contour(X, Y, Z2, [0,0], 'g-', 'linewidth', 2)

figure
contour(X, Y, Z1, [0,0], 'r-', 'linewidth', 2)
hold on
contour(X, Y, Z2, [0,0], 'g-', 'linewidth', 2)

x0 = [-2; 3];
tolx = 1e-10;
tolf = tolx;
nmax = 200;
[x1, Er, it] = newtonSys(f, jac, x0, tolx, tolf, nmax)

plot3(x1(1), x1(2), f([x1(1), x1(2)]), 'ro')

figure
semilogy(1:it, Er, 'r-o')


