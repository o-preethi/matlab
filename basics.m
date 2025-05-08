%BASIC matrix operations 

A=[1,2;3,4];%defines a matirx with delimiters ',' as row delimiter and ';' as column delimiter 

y=zeros(2,3);%creates a matrix of zeros with 2 rows and 3 columns

x=ones(3,2);%creates a matrix of ones with 3 rows and 2 columns

z=eye(5);%creates indentity matrix of 5x5

a=rand(1,3);%creates a matrix of random values with 1 row and 3 columns 

b=randn(3,6);%creates a matrix of random values normally distributed with 1 row and 3 columns

c=size(A);%gives size of matrix A

d=length(A);%largest dimension length

e=reshape(A,4,1); %reshapes the dimensions but the total no. of elements must be same

f=transpose(A);%or we can write A.'

g=A';%conjugate transpose for complex matrixes

h=flip(A);%flip matrix left to right and up to down 

i=flipud(A);%flip up to down

j=fliplr(A);% flip right to left

k=rot90(A);%rotates 90 counterclock wise

% arithematic operations

B=[2,4;3,8];

l=A+B;%addition of two vectors

m=A-B;%subtraction of two vectors

n=A*B;%multiplication of two vectors

o=A.*B;%element wise multiplication

p=A/B;%matrix right divison (A*inv(B))

q=A\B;%matrix left divison (inv(A)*B)

r=A./B;%element wise divison

s=A.^2;%element wise power

t=inv(A);%inverse of matrix A

u=det(A);%determinant of A

v=rank(A);%rank of A

w=trace(A);%sum of diagonal elements

%properties of matrix 

ab=isnan(A);%checks for Nan in A

cd=isempty(A);%checks if empty 

ef=issymmetric(A);%checks if symmetric

gh=eig(A);%eigen values of A

ij=svd(A);%singular value decomposition

kl=norm(A);%matrix norm default is 2

mn=A(:,2);%access 2nd column of A matrix

op=A(2,:);%access 2nd column of A matrix

qr=diag(A);%extract diagonal elements

uv=1:5

st=diag(uv);%creates diagonal matrix from vector uv

%logical and relational operations 

% we can use these in loops for conditional verification

% A>B,A==B element wise comparison

wx=find(A);%indices of non-zero elements

yz=any(A);%checks if any non-zero elements

abc=all(A);%checks if all elements are non-zero
