function u_corr(x,h,N) % performs correlation of sequences
if nargin==1 %if only one input is provided it performs autocorrelation
    n=length(x);
    op_len=2*n-1;
    xm=[zeros(1,n-1) x];
    hm=[x zeros(1,n-1)];
elseif nargin==2||nargin==3 %if 2 or 3 inputs are provided we get cross correlation
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
if nargin==3 %if operational length is specified we get modified output
    if N+1==n
        y=[0 y 0]; %zero padding 
    elseif N+1<n
        diff=n-N-1;
    y = y((1+diff):end-diff); %wrapping 
       elseif N+1>n
        diff=-n+N+1;
    y = [zeros(1,diff) y zeros(1,diff)]; %zero padding
    end
end  
 y
 end 
