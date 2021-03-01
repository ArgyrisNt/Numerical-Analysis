% Some examples in SVD Decomposition

%% Example 1
clear all;
clc;

A = [0 1 1;sqrt(2) 2 0;0 1 1];
[U,S,V] = svd(A);

% Singular values
for i = 1:size(S,1)
    s(i) = S(i,i);
end

% Left singular vectors
for i = 1:size(U,1)
    u(:,i) = U(:,i);
end

% Right singular vectors
for i = 1:size(V,1)
    v(:,i) = V(:,i);
end

% Calculate AA'
A1 = U*(S^2)*U';

% Calculate A'A
A2 = V*(S^2)*V';

% Delete zero singluar values (Low-Rank)
S(:,all(S==0))=[];
S(~any(S,2),:)=[];
U = U(:,1:size(S,1));
V = V(:,1:size(S,1));

% Approximate matrix A
Ak = 0;
for i = 1:size(S,1)
    Ak = Ak + S(i,i)*U(:,i)*V(:,i)';
end

% Estimate approximation error
error1 = norm(A-Ak);
error2 = s(3);


%% Example 2
clear all;
clc;

A = [-1 -1 -1;0 1 -1;-1 0 1;0 0 -1];
[U,S,V] = svd(A);

% Singular values
for i = 1:size(S,2)
    s(i) = S(i,i);
end

% Left singular vectors
for i = 1:size(U,1)
    u(:,i) = U(:,i);
end

% Right singular vectors
for i = 1:size(V,1)
    v(:,i) = V(:,i);
end

% Delete zero singluar values (Low-Rank)
S(:,all(S==0))=[];
S(~any(S,2),:)=[];
U = U(:,1:size(S,1));
V = V(:,1:size(S,1));

% Approximate matrix A
Ak = 0;
for i = 1:size(S,1)
    Ak = Ak + S(i,i)*U(:,i)*V(:,i)';
end

% % Estimate approximation error
error1 = norm(A-Ak);