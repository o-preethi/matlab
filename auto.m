function auto(x,N) %function which replicates a auto correlation
    n=length(x); 
    op_len=2*n-1;
    xm=[zeros(1,n-1) x]; %we are zero padding to perform auto correlation
    hm=[x zeros(1,n-1)];
for i=1:op_len
        hrm=[zeros(1,i-1) hm(1:op_len-i+1)];
        y(i)=(xm*hrm');
 end 
if nargin==2 %if operational length is specified we get the modified output which is either wrapped or zero padded based on the operational length
    if N+1==n
        y=[0 y 0];%zero padding
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
