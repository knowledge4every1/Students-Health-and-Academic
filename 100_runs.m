results = zeros(100,1);
for i = 1:100
    fprintf('Run %d...\n', i);
    step3_genetic_algorithm; % reuse the function or script
    step4_pattern_search;    % reuse the function or script
    load('refined_weights.mat');
    results(i) = refinedFitness;
end

save('fitness_statistics.mat', 'results');
fprintf('Mean Fitness: %.6f\n', mean(results));
fprintf('STD Fitness: %.6f\n', std(results));
