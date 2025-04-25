% Load dataset
data = readtable('college_students_health_academic_performance.xlsx');

% Normalize numeric columns using Min-Max normalization
numericVars = varfun(@isnumeric, data, 'OutputFormat', 'uniform');
dataNorm = data;
for i = find(numericVars)
    col = table2array(data(:,i));
    dataNorm{:,i} = (col - min(col)) / (max(col) - min(col));
end

% Encode categorical columns
categoricalVars = varfun(@iscell, data, 'OutputFormat', 'uniform');
for i = find(categoricalVars)
    [~,~,dataNorm{:,i}] = unique(data{:,i});
end

% Save preprocessed data
save('preprocessed_data.mat', 'dataNorm');
