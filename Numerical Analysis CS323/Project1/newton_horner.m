clear all; close all;

%read file containing problem and store it
fileIn = fopen('newton5.txt','r');
arr = fscanf(fileIn,'%f',[1 Inf]);
arrSize = size(arr);

%get poly degree, numbers in poly, X0, error, and max iterations
deg = arr(1);
nums = arr(2:arrSize(2)-3);
x0 = arr(arrSize(2)-2);
epsilon = arr(arrSize(2)-1);
N = arr(arrSize(2));
numsSize = size(nums);


%implementing horners algo that we made
a = nums(numsSize(2));
b = nums(numsSize(2));
i = numsSize(2)-1;
while i >= 1
  if i ~= 1
  a = a * x0 + nums(i);
  b = b * x0 + a;
  else 
  a = a * x0 + nums(i);
  end 
  i = i - 1; 
end


%Continue to do iterations, until you reach max iterations or you are
%within error range
%compute new x1 by newtons method
N = N - 1;
x1 = x0 - (a/b);
err = abs(x1 - x0);

while err > epsilon && N > 0
    x0 = x1;
    a = nums(numsSize(2));
    b = nums(numsSize(2));
    i = numsSize(2)-1;
    while i >= 1
        if i ~= 1
            a = a * x0 + nums(i);
            b = b * x0 + a;
        else
            a = a * x0 + nums(i);
        end
        i = i - 1;
    end
    %mark down iterations, compute new x and then error
    N = N - 1;
    x1 = x0 - (a/b);
    err = abs(x1 - x0);
end

%display result
if N > 0
    fprintf("One root is: " + x0 + "\n");
else
        fprintf("no solution found \n");
end

fclose(fileIn);