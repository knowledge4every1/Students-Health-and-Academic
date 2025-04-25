% Load dataset
load('preprocessed_data.mat', 'dataNorm');

% Learning rates to test
learning_rates = [0.0135, 0.0013, 0.00046, 0.00013];
num_runs = length(learning_rates);

% Initialize results storage
Results = table('Size', [num_runs 4], ...
                'VariableTypes', {'double', 'double', 'double', 'double'}, ...
                'VariableNames', {'LearningRate', 'OP', 'EP', 'HI'});

% Dummy fitness evaluation function (you will replace this with your actual IDA)
% Here, we simulate outputs based on learning rate
simulate_performance = @(lr) [97 + rand()*1, 82 + rand()*3, 0.8 + rand()*0.04];

% Run ablation for each learning rate
for i = 1:num_runs
    lr = learning_rates(i);
    
    % Normally you'd pass 'lr' to your IDA function and collect results
    % [op, ep, hi] = run_IDA_with_learning_rate(dataNorm, lr);
    
    % Simulated output for placeholder
    [op, ep, hi] = simulate_performance(lr);

    Results.LearningRate(i) = lr;
    Results.OP(i) = op;
    Results.EP(i) = ep;
    Results.HI(i) = hi;
end

% Save results
writetable(Results, 'ablation_study_results.xlsx');
disp(Results);

% Plot results
figure;
subplot(3,1,1);
plot(Results.LearningRate, Results.OP, '-o'); title('Overall Performance vs Learning Rate'); xlabel('Learning Rate'); ylabel('OP');

subplot(3,1,2);
plot(Results.LearningRate, Results.EP, '-o'); title('Educational Performance vs Learning Rate'); xlabel('Learning Rate'); ylabel('EP');

subplot(3,1,3);
plot(Results.LearningRate, Results.HI, '-o'); title('Health Indicator vs Learning Rate'); xlabel('Learning Rate'); ylabel('HI');
