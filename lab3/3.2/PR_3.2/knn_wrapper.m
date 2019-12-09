function callKNN = knn_wrapper(nr_of_classes,K)
  %fetch data and generate labels
  [data, class_labels] = data_labels(nr_of_classes);
  range(class_labels,'all')
  
  % Sample the parameter space
  samples = 64;
  result=zeros(samples);
  for i=1:samples
    X=(i-1/2)/samples;
    for j=1:samples
      Y=(j-1/2)/samples;
      result(j,i) = KNN([X Y],K,data,class_labels);
    end
  end

  % Show the results in a figure
  imshow(result,[0 nr_of_classes-1],'InitialMagnification','fit')
  hold on;
  title([int2str(K) '-NN, ' int2str(nr_of_classes) ' classes']);

  scaled_data=samples*data;
  if nr_of_classes == 2
    plot(scaled_data(  1:100,1),scaled_data(  1:100,2),'go');
    plot(scaled_data(101:200,1),scaled_data(101:200,2),'r+');
    hold off
  else
    plot(scaled_data(  1:50,1),scaled_data(  1:50,2),'go');
    plot(scaled_data(51:100,1),scaled_data(51:100,2),'b*');
    plot(scaled_data(101:150,1),scaled_data(101:150,2),'r+');
    plot(scaled_data(151:200,1),scaled_data(151:200,2),'cs');
    hold off
  end