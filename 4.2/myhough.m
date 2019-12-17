function accumulator = myhough(edge_map)
  theta = [1:180];
  theta = deg2rad(theta);
  sizex = size(edge_map,1);
  sizey = size(edge_map,2);
  maxrho = floor(sqrt(sizex^2+sizey^2));
  
  %The maximum possible (absolute) value of rho is the length of the image diagonal in pixels.
  %Rho indices in accumulator array are augmented by this value (+1, to
  %include 0) to map [-maxrho,maxrho] into [1,2maxrho+1]
  
  %static array initialization
  accumulator = zeros([2*maxrho+1,180]);
  %size(accumulator)
  for i = 1:sizex
    for j = 1:sizey
      if (edge_map(i,j) == 1)
        k = 0;
        for angle = theta
          k = k+1;
          rho = floor(i*cos(angle) + j*sin(angle));
          idx1 = rho + maxrho + 1;
          idx2 = k;
          %{
          if floor(idx1)~=idx1 || floor(idx2)~=idx2 || idx1 <= 0 || idx2 <= 0
            [idx1, idx2]
          end
          %}
          accumulator(idx1,idx2) = accumulator(idx1,idx2) + 1;
        end
      end
    end
  end
end