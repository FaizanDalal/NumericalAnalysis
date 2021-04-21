function det = gaussian(A, b, col)
n = size(A, 1); %size
r = zeros(n, 1); 
for i = 1:1:n    
   r(i) = i;
end
if col ~= 0
    for i=1:n
        A(i,col) = b(i);
    end
end

sign = 1;
for k = 1 : 1 : n %gaussian algo 
    if A(r(k), r(k)) == 0      
        for m = k : 1 : n        
            if A(r(m), r(k)) ~= 0  
                temp_r = r;
                r(k) = temp_r(m);
                r(m) = temp_r(k);
                sign = sign * -1;
            else
                fprintf('Error \n');
                return;
            end
        end
    end
    for i = k+1 : 1 : n
        zeta = A(r(i), k) / A(r(k), k);
        for j = k : 1 : n
            A(r(i), j) = A(r(i), j) - A(r(k), j) * zeta;                       
        end
    end
end
% Compute determinant using diagonals
det = sign;
for i = 1:1:n
    det = det * A(r(i), i);
end
end