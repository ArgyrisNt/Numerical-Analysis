function [u]=PowerMethod(A,x0,k);
% A=[-2 1 0;1 -2 1;0 1 -2];
% x0=[-1;2;3];
% k=10
u=zeros(3,3);
for j=1:size(A,1)
    i=0;
    while i<k
          yk=A*x0;
          lamda(j)=yk(2)/x0(2);
          xk=yk/norm(yk);
          x0=xk;
          i=i+1;
    end
    u(:,j)=xk;
    A=A-lamda(j)*u(:,j).*(u(:,j)');
end
lamda % Eigenvalues
u; % Eigenvectors
