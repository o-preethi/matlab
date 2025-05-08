%cross correlation
function u_xcorr(x,h,N)
if nargin==2||nargin==3 %performs cross correlation based on the two input signals provided
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
if nargin==3 %if operation length is provided
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
