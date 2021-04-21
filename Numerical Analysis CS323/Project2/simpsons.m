format long
fileID = fopen('simpsons5.txt','r');
func = fscanf(fileID,'%s',1);
a = fscanf(fileID,'%f',1); %finding a 
b = fscanf(fileID,'%f',1); %finding b
n = fscanf(fileID,'%f',1); %number of intervals
%calculate the length of a subinterval
h = (b-a)/n;
%create a vector of each subinterval
x = a:h:b;
fun = inline(func);
f1 = feval(fun, x(1)); %f(x0)
fnn = feval(fun, x(n+1)); %f(xn)
even = 0; 
for i=3:2:length(x)-1 %(loop for calculating even i
    f = feval(fun, x(i));
    even = even + f;
end
odd = 0;
for i=2:2:length(x)-1 %loop for odd i
    f = feval(fun, x(i));
    odd = odd + f;
end

ans = h/3 * (f1 + 2*even + 4*odd + fnn); %final answer calculation 
fprintf("The result of computing this integral is: " + ans + "\n");
fclose(fileID);