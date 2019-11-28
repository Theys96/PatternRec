function codes = load_iriscodes(num_files, file_pattern)
codes = [];
for i = 1:num_files
    file = sprintf(file_pattern, i);
    file_data = load(file);
    codes(:,:,i) = file_data.iriscode;  %3rd dimension of array represents person
end;
end