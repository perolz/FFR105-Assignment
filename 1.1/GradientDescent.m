function iIteration=GradientDescent(startingPoint,my,stepLength,threshold)

  %Finding minimum close to startpoint
  tempFun=@(x) PenaltyFunction(x(1),x(2),0);
  x=fminsearch(tempFun,startingPoint);

  iIteration=x;
  tempBol=norm(Gradient(iIteration(1),iIteration(2),my))>threshold;
  while(tempBol)
    iIteration=iIteration-stepLength*Gradient(iIteration(1),iIteration(2),my);
    tempBol=norm(Gradient(iIteration(1),iIteration(2),my))>threshold;
  end

end