function neville(fileName)

%open file and place input into a temp array 
fileID = fopen('neville4.txt', 'r');
temp = fscanf(fileID, '%f', [1 Inf]); 

%breaking input into parts

n = temp(1);
n=n+1;
n2 = (n*2)+1;
cord = zeros(1,n2);
A = zeros(n);

for i = 2:size(temp,2)-1
    cord(i-1) = temp(i);
end

x0 = temp(size(temp,2));

%splitting the array into x and y terms 
xcord = zeros(1,n);

for i = 1:numel(xcord)
    xcord(i) = cord(i*2-1);
end
ycord = zeros(1,n);

for i=1:numel(ycord)
    ycord(i) = cord(i*2);
end

%filling diagnola with y values 

for i = 1:n
   A(i,i) = ycord(i); 
end
%compute nevilles using the algo given in lecture 

for d=2:n
    for i=1:n-d+1
        j=i+d-1;
        A(i,j) = (((x0-xcord(i))*A(i+1,j))-((x0-xcord(j))*A(i,j-1)))/(xcord(j)-xcord(i)); 
    end
end

%print statement  

fprintf("P(X) = " + A(1,n) + "\n");