clear all,clc

startingPoint=[1,2];
my=[1,10,100,1000];
stepLength=1e-4;
threshold=1e-6;
numberOfMy=length(my);

result=zeros(numberOfMy,3);
for i=1:length(my)
  zero=GradientDescent(startingPoint,my(i),stepLength,threshold);
  result(i,1)=my(i);
  result(i,2:3)=zero;
end

disp('  mu    x1    x2')
fprintf('%4.0f %1.3f %1.3f \n',result')