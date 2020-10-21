function c=vqlbg(d,k)
  c=zeros(size(d,1),k);
  prev_c=c;
  eps=0.01;
  c(:,1)=mean(d,2);
  curr=1;
  while true
    curr=2*curr;
    aux=zeros(size(d,1),curr);
    j=1;
    for i=1:curr/2
      aux(:,j)=c(:,i)*(1+eps);
      aux(:,j+1)=c(:,i)*(1-eps);
      j=j+2;
    endfor
    prev_c=aux;
    while true
      z=disteu(d,prev_c);
      [mins,ind]=min(z,[],2);
      for i=1:curr
        c(:,i)=mean(d(:,ind==i),2);
      endfor
      if norm(c(:,1:curr)-prev_c(:,1:curr))<0.0001
        break;
      endif
      prev_c=c;
    endwhile
    if curr>=k
      break;
    endif
  endwhile
endfunction
