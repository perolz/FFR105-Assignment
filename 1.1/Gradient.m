function x=Gradient(x1,x2,my)
  %Condition and gradient from 1.2
  tempBol=(x1^2+x2^2-1)>0;
  if(tempBol)
    x(1)=2*x1-2+4*my*x1*(x1^2+x2^2-1);
    x(2)=4*x2-8+4*my*x2*(x1^2+x2^2-1);
  else
    x(1)=2*x1-2;
    x(2)=4*x2-8;
  end

end