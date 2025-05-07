function u_corr(x,h,N)
if nargin==1
    n=length(x);
    op_len=2*n-1;
    xm=[zeros(1,n-1) x];
    hm=[x zeros(1,n-1)];
elseif nargin==2||nargin==3
    n=length(x);
    m=length(h);
    op_len=m+n-1;
    xm=[zeros(1,n-1) x];
    hm=[h zeros(1,m-1)];
end
for i=1:op_len
        hrm=[zeros(1,i-1) hm(1:op_len-i+1)];
        y(i)=(xm*hrm');
 end 
if nargin==3
    if N+1==n
        y=y;
    elseif N+1<n
        diff=n-N-1;
    y = y((1+diff):end-diff);
    end
end  
 y
 end 
