format long
fileID = fopen('least5.txt','r');
m = fscanf(fileID,'%f',1); %finds num of points 
deg = fscanf(fileID,'%f',1); %finds deg of poly
x = zeros(m,1);
y = zeros(m,1);
for i = 1:m
    x(i) = fscanf(fileID,'%f',1); %finds x vals
    y(i) = fscanf(fileID,'%f',1); %finds y vals 
end
%create matrix representing system of deg+1 equations
M = zeros(deg+1,deg+1);
for i=1:deg+1
    for j=1:deg+1
        M(i,j) = sum(x.^(j+i-2));
    end
end
disp(M)
b = zeros(deg+1,1);
for k=1:deg+1
    b(k) = sum(y.*(x.^(k-1)));
end
disp(b)
%calculate solution and print
a=inv(M)*b;
for i=1:length(a)
    fprintf('%f ',a(i));
end
%create plot and display
xx=[x(1):0.1:x(m)];
yy=0;
for i=1:length(a)
    yy = yy + a(i)*xx.^(i-1);
end
plot(xx,yy,x,y,'*');
fclose(fileID);