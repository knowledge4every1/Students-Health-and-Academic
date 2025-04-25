load('fitness_statistics.mat');

mean_val = mean(results);
std_val = std(results);
kurtosis_val = kurtosis(results);

fprintf('Mean: %.6f, STD: %.6f, Kurtosis: %.6f\n', mean_val, std_val, kurtosis_val);

figure;
histogram(results, 20);
title('Fitness Distribution Across 100 Runs');
xlabel('Fitness'); ylabel('Frequency');
