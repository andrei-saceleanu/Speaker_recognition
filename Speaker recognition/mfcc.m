function c=mfcc(s,fs)
  N=256;
  M=100;
  p=20;
  X=zeros(N,1);
  X(:,1)=s(1:N);
  k=2;
  for i=N+M:M:length(s)
    X(:,k)=s(i-N+1:i);
    k=k+1;
  endfor
  hamm=hamming(N);
  for i=1:size(X,2)
    X(:,i)=fft(X(:,i).*hamm);
  endfor
  m=melfb(p,N,fs);
  n2=1+floor(N/2);
  Y=zeros(20,size(X,2));
  for i=1:size(Y,2)
    Y(:,i)=m*abs(X(1:n2,i)).^2;
  endfor
  c=dct(log(Y));
  c(1,:)=[];
endfunction
