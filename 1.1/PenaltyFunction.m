function functionValue = PenaltyFunction(x1,x2,my)
  f=(x1-1)^2+2*(x2-2)^2;
  constraint=x1^2+x2^2-1;
  functionValue=f+my*max(constraint,0);
end