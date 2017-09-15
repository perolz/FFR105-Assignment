clear all, clc

fileID=fopen('ForReport.txt','a');
fmt='%5d %5d %5d %5d\n';

numberOfGenes = 100;
variableRange = 5;
numberOfGenerations = 40;
numberOfVariables=2;


populationSize= 30;
crossoverProbability = 0.8;
mutationProbability = 0.025;
tournamentSelectionParameter = 0.70;
tournamentSize=2;
average=[];

for k=1:3
  
for k2=1:20
fitness = zeros(populationSize,1);
population = InitializePopulation(populationSize,numberOfGenes);
    
    for iGeneration =1:numberOfGenerations
      maximumFitness = 0.0; % Assumes non-negative fitness values
      xBest = zeros(1,numberOfVariables);%[0,0]
      bestIndividualIndex=0;
      
      
      
      for i = 1:populationSize
        chromosome = population(i,:);
        x=DecodeChromosome(chromosome,numberOfVariables,variableRange);
        decodedPopulation(i,:)=x; %For plot
        fitness(i) = EvaluateIndividual(x);
        if(fitness(i)>maximumFitness)
          maximumFitness = fitness(i);
          bestIndividualIndex=i;
          xBest=x;
        end
      end
      %Store to be able to use elitism for next generation
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
      end % Loop over population
      
      for i =1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
      end
      
      tempPopulation(1,:) = population(bestIndividualIndex,:);
      population = InsertBestIndividual(tempPopulation,bestIndividualPreviousGeneration,1);
      
    end
    average(k2,:)=[xBest 1/maximumFitness];
end
  average=mean(average);
  tmp=[tournamentSize tournamentSelectionParameter average(1) average(2)];
  fprintf(fileID,fmt,tmp);
  tournamentSelectionParameter=tournamentSelectionParameter+0.1;
end
disp(average)
fclose(fileID);
