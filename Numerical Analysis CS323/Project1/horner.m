%clear all; close all;

%read file containing problem and store it in an array
fileIn = fopen('horner5.txt','r');
arr = fscanf(fileIn,'%f',[1 Inf]);
arrSize = size(arr);

deg = arr(1); %gets degree
nums = arr(2:arrSize(2)-1); %gets nums 
x0 = arr(arrSize(2)); %gets x0
numsSize = size(nums); %gets size

a = nums(numsSize(2)); %gets inital a
b = nums(numsSize(2)); %gets initial b 

i = numsSize(2)-1;
while i >= 1
    % loop to compute P(x0) and P'(x0) 
    %algo we did in lecture 5
   if i ~= 1
   a = a * x0 + nums(i);
   b = b * x0 + a;
   else 
   a = a * x0 + nums(i);
   end 
   i = i - 1;  
end

%prints P(x0) and P'(x0)
fprintf("P(x0) = " + a + "\n");
fprintf("P'(x0) = " + b + "\n")
%couldn't finish implementing with multi derivatives in time

fclose(fileIn);


