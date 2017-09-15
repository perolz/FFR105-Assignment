clear all, clc

numberOfGenes = 100;
variableRange = 5;
numberOfGenerations = 100000;
numberOfVariables=2;


populationSize= 40;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
tournamentSize=4;

fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize,numberOfGenes);
for iGeneration =1:numberOfGenerations
  maximumFitness = 0.0; % Assumes non-negative fitness values
  xBest = zeros(1,numberOfVariables);
  bestIndividualIndex=0;
  
  
  
  for i = 1:populationSize
    chromosome = population(i,:);
    x=DecodeChromosome(chromosome,numberOfVariables,variableRange);
    fitness(i) = EvaluateIndividual(x);
    if(fitness(i)>maximumFitness)
      maximumFitness = fitness(i);
      bestIndividualIndex=i;
      xBest=x;
    end
  end
  %Used for elitism in next generation
  bestIndividualPreviousGeneration=population(bestIndividualIndex,:);
  
  tempPopulation=population;
  
  for i=1:2:populationSize
    i1 = TournamentSelect(fitness,tournamentSelectionParameter, ...
      tournamentSize);
    i2 = TournamentSelect(fitness,tournamentSelectionParameter, ...
      tournamentSize);
    chromosome1 = population(i1,:);
    chromosome2 = population(i2,:);
    
    r=rand;
    if(r<crossoverProbability)
      newChromosomePair = Cross(chromosome1,chromosome2);
      tempPopulation(i,:)= newChromosomePair(1,:);
      tempPopulation(i+1,:) = newChromosomePair(2,:);
    else
      tempPopulation(i,:)=chromosome1;
      tempPopulation(i+1,:)=chromosome2;
    end
  end

  for i =1:populationSize
    originalChromosome = tempPopulation(i,:);
    mutatedChromosome = Mutate(originalChromosome,mutationProbability);
    tempPopulation(i,:) = mutatedChromosome;
  end
  
  tempPopulation(1,:) = population(bestIndividualIndex,:);
  population = InsertBestIndividual(tempPopulation,bestIndividualPreviousGeneration,1);
  
end
%Final result
disp('xBest');
disp(xBest);
disp('Function value');
disp(1/maximumFitness);