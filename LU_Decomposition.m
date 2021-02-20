clear all;
clc;

A = [1 1 2;2 -1 1;3 1 1];
b = [9;3;8];
m = [];
L = [];
U = [];

% Gauss factorization
for i = 2:3
    for k = 1:i-1
        m(i,k) = A(i,k)/A(k,k);
        for j = 1:3
            A(i,j) = A(i,j)-m(i,k)*A(k,j);
        end
    end
end

% LU decomposition
for i = 1:3
    for j = 1:3
        if i<j
           L(i,j) = 0;
           U(i,j) = A(i,j);
        elseif i>j
           L(i,j) = m(i,j);
           U(i,j) = 0;
        else
           L(i,j) = 1;
           U(i,j) = A(i,j);
        end
    end
end

% Solve Ly=b with forward method
for j=1:size(L,2)
    y(1)=b(1)/L(1,1);
    for i=2:size(L,1)
        sum=0;
        for k=1:i-1
            sum=sum+L(i,k)*y(k);
        end
        y(i)=(b(i)-sum)/L(i,i);
    end
end
y=transpose(y);

% Solve Ux=y with backward method
n = size(A,2);
for j=1:n
    x(n)=y(n)/U(n,n);
    for i=size(A,1)-1:-1:1
        sum=0;
        for k=i+1:3
            sum=sum+U(i,k)*x(k);
        end
        x(i)=(y(i)-sum)/U(i,i);
    end
end
x = transpose(x);
L*U*x == b;
