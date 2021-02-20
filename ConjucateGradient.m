function X=ConjucateGradient(a11,a12,a21,a22,b1,b2,x1,x2,repeat);
A=[a11 a12;a21 a22];
b=[b1;b2];
X=[x1;x2];
r=b-A*X;
d=r;
k=1;
while k<=repeat
   omega = A*d;
   alpha=r'*r./(d'*omega);
   X=X+alpha*d;
   ri=r;
   r=ri-alpha*omega;
   bita = (r'*r)./(ri'*ri);
   d = r+bita*d;
   k=k+1;
end
end
