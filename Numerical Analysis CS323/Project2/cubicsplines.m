format long
fileID = fopen('cubic5.txt','r');
%scan first number for number of points
m = fscanf(fileID,'%f',1);

x = zeros(m,1);
y = zeros(m,1);
for i = 1:m %scan x and y values into vectors
    x(i) = fscanf(fileID,'%f',1);
    y(i) = fscanf(fileID,'%f',1);
end

matrix = zeros(m, m);
matrix(1,1) = 1;
matrix(m,m) = 1;

sol = zeros(m,1);
for i=2:m-1 %loop to fill the matrix 
    h0 = x(i) - x(i-1);
    h1 = x(i+1) - x(i);
    matrix(i,i-1) = h0;
    matrix(i,i) = 2 * (h0+h1);
    matrix(i,i+1) = h1;
    sol(i) = (3/h1) * (y(i+1)-y(i)) - (3/h0) * (y(i)-y(i-1)); %formula for solutions
end
%solve for c
C = linsolve(matrix,sol);
%solve for d
D = zeros(m-1,1);
for i=1:m-1
    hi = x(i+1) - x(i);
    D(i) = (1/(3*hi)) * (C(i+1)-C(i));
end
%solve for b
B = zeros(m-1,1);
for i=1:m-1
    hi = x(i+1) - x(i);
    B(i) = ((y(i+1)-y(i))/hi) - (2*C(i)+C(i+1))/3 * hi;
end
for i=1:m-1
    fprintf('%f %f %f %f\n', y(i), B(i), C(i), D(i));
end
%plot the cubic spline
xx = x(1):(x(2)-x(1))/10:x(m);
yy = spline(x,y,xx);
plot(x,y,'o',xx,yy)
fclose(fileID);