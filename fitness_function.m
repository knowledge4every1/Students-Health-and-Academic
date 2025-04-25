function fitness = step2_fitness_function(weights, data)
    % Assume data is a table with normalized and encoded features
    % Weight vector should sum to 1
    dataMatrix = table2array(data);
    composite = dataMatrix * weights(:);
    
    % Example fitness: negative variance (maximize consistency)
    fitness = -var(composite); 
end
