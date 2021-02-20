clc;
clear all;
% dimension of matrix
n=500; 
% generate a tridiagonal matrix with the previous random elements
A = spdiags(zeros(n),-1:1,n,n);
% symmetric matrix
for i=1:n-1
    A(i,i+1) = 1+i; 
    A(i+1,i) = A(i,i+1);
end
% define elements of main diagonal according to given constraints and the
% right hand side vector
for i=1:n
    A(i,i) = 1000+i; 
    b(i) = 1+i;
end
full(A);
b=transpose(b);

% apply the Cholesky decomposition
L = zeros(n);
for j = 1:n
    for i = 1:j-1
        sum1 = 0;
        for k = 1:i-1
            sum1 = sum1 + L(k,i)*L(k,j);
        end
        L(i,j) = (A(i,j)-sum1)/L(i,i);
    end
    sum2 = 0;
    for r = 1:j-1
        sum2 = sum2 + L(r,j)^2;
    end
    L(j,j) = sqrt(A(j,j)-sum2);
end
L;
LT=transpose(L);

% solve Ly=b with forward method
for j=1:n
    y(1)=b(1)/L(1,1);
    for i=2:n
        sum=0;
        for k=1:i-1
            sum=sum+L(i,k)*y(k);
        end
        y(i)=(b(i)-sum)/L(i,i);
    end
end
y=transpose(y);

% solve (LT)x=y with backward method
for j=1:size(A,2)
    x(n)=y(n)/LT(n,n);
    for i=size(A,1)-1:-1:1
        sum=0;
        for k=i+1:3
            sum=sum+LT(i,k)*x(k);
        end
        x(i)=(y(i)-sum)/LT(i,i);
    end
end
x = transpose(x)
