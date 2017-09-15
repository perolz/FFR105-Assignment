function iSelected = TournamentSelect(fitness,pTournament,tournamentSize)

  populationSize= size(fitness,1);
  for i=1:tournamentSize
    iTmp(1,i)=1+fix(rand*populationSize);
    iTmp(2,i)=fitness(i);
  end
  %Sort all the fitness values, so the largest is in position 1
  iTmp=sort(iTmp,2,'descend');
  iSelected=-1;
  while(iSelected<0)
  r=rand;
    if(r < pTournament)
      iSelected=iTmp(1,1);
    else
      iTmp=iTmp(:,2:end);
    end
    if(length(iTmp)==2)
      
      iSelected = iTmp(1,1);
    end
  end
  
end