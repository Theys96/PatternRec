function [data, class_labels] = data_labels(nr_of_classes)  
  data = load('lab3_2.mat').lab3_2;
  class_labels = floor( (0:length(data)-1) * nr_of_classes / length(data) );
end