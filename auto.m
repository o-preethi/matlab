function auto(x,N)
    n=length(x);
    op_len=2*n-1;
    xm=[zeros(1,n-1) x];
    hm=[x zeros(1,n-1)];
for i=1:op_len
        hrm=[zeros(1,i-1) hm(1:op_len-i+1)];
        y(i)=(xm*hrm');
 end 
if nargin==3
    if N+1==n
        y=[0 y 0];
    elseif N+1<n
        diff=n-N-1;
    y = y((1+diff):end-diff);
    elseif N+1>n
        diff=N+1-n;
        y = [ zeros(1,diff) y zeros(1,diff)];
    end
end  
 y
 end 
