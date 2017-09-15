function gFitness = EvaluateIndividual(x)
  gNumerator1 = (x(1)+x(2)+1)^2;
  gNumerator2 = 19-14*x(1)+3*x(1)^2-14*x(2)+6*x(1)*x(2)+3*x(2)^2;
  gNumerator3 = (2*x(1)-3*x(2))^2;
  gNumerator4 = 18-32*x(1)+12*x(1)^2+48*x(2)-36*x(1)*x(2)+27*x(2)^2;
  
  g = (1+gNumerator1*gNumerator2)*(30+gNumerator3*gNumerator4);
  gFitness=1/g;
end