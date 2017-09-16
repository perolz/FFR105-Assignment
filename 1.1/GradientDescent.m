function iIteration=GradientDescent(startingPoint,my,stepLength,threshold)
  iIteration=startingPoint;
  tempBol=norm(Gradient(iIteration(1),iIteration(2),my))>threshold;
  while(tempBol)
    iIteration=iIteration-stepLength*Gradient(iIteration(1),iIteration(2),my);
    tempBol=norm(Gradient(iIteration(1),iIteration(2),my))>threshold;
  end

end