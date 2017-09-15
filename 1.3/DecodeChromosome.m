function x = DecodeChromosome(chromosome,variablesExtracted,variableRange)
  nGenes = size(chromosome,2);
  bitsPerVariable=nGenes/variablesExtracted;
  
  for i=1:variablesExtracted
    x(i)= 0.0;
  
    for j = 1:bitsPerVariable
      x(i) = x(i)+chromosome(j+bitsPerVariable*(i-1))*2^(-j);
    end
    x(i)= -variableRange + 2*variableRange*x(i)/(1-2^(-bitsPerVariable));
  end
  
end