format long
fileID = fopen('cramer5.txt','r');
dim = fscanf(fileID,'%f',1);
matrix = zeros(dim,dim);

matrix = fscanf(fileID,'%f', [dim,dim]);%check matrix values and format them
matrix = matrix.';

sol = fscanf(fileID,'%f', dim);%check solution values 

determinants = zeros(dim,1);%call gaussian to  xs 
x = zeros(dim,1);

determinantA = gaussian(matrix,sol,0); %call gaussian to compute A1-An

for i=1:dim %calculating determinants 
    determinants(i) = gaussian(matrix,sol,i);
    x(i) = determinants(i) / determinantA;
end
%display output
fprintf('Determinant A: %f\n',determinantA);
for i=1:dim
    fprintf('Determinant A%d: %f\n',i,determinants(i));
end
for i=1:dim
    fprintf('x%d: %f\n',i,x(i));
end
fclose(fileID);