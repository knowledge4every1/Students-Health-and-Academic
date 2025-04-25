load('preprocessed_data.mat');
load('weights_from_ga.mat');

opts = optimoptions('patternsearch',...
    'UseCompletePoll', true,...
    'Display', 'iter',...
    'MaxFunctionEvaluations', 175000);

fitnessFcn = @(w) step2_fitness_function(w, dataNorm);
[refinedWeights, refinedFitness] = patternsearch(fitnessFcn, optWeights, [], [], Aeq, beq, lb, ub, [], opts);

save('refined_weights.mat', 'refinedWeights', 'refinedFitness');
