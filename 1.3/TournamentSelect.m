function iSelected = TournamentSelect(fitness,pTournament,tournamentSize)

  populationSize= size(fitness,1);
  for i=1:tournamentSize
    individualsWithFitness(1,i)=1+fix(rand*populationSize);
    individualsWithFitness(2,i)=fitness(i);
  end
  %Sort all according to the fitness values, so the largest is
  %in position 1
  individualsWithFitness=sort(individualsWithFitness,2,'descend');
  iSelected=-1;
  while(iSelected<0)
  r=rand;
    if(r < pTournament)
      iSelected=individualsWithFitness(1,1);
    else
      individualsWithFitness(:,1)=[];
      if(length(individualsWithFitness(1,:))==1)
        iSelected = individualsWithFitness(1,1);
      end
    end
  end
  
end