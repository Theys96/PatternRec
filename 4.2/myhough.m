function accumulator = myhough(edge_map)
  theta = [-90:90];
  theta = deg2rad(theta);
  sizex = size(edge_map,1);
  sizey = size(edge_map,2);
 
  %The maximum possible (absolute) value of rho is the length of the image diagonal in pixels.
  %Rho indices in accumulator array are augmented by this value (+1, to
  %include 0) to map [-maxrho,rho] into [0,maxrho]
  %like the ML native function does.
  
  if (sizex == sizey)
    maxrho = floor(sqrt(2)*sizex);
  else
    error('image must be square');
  end
  
  %dynamic allocation. Accumulator array must be M x N where
  %M = number of values of rho
  %N = number of values of theta
  accumulator = []; 

  for i = 1:sizex
    for j = 1:sizey
      if (edge_map(i,j) == 1) %consider foreground pixels only
        k = 0;
        for angle = theta
          k = k+1;
          rho = floor(i*cos(angle) + j*sin(angle));
          %the following condition attachs a new dimension if the
          %accumulator array is yet too small.
          if (size(accumulator,1) < rho+maxrho+1 || size(accumulator,2) < k)
            accumulator(rho+maxrho+1,k) = 1;
          else
            accumulator(rho+maxrho+1,k) = accumulator(rho+maxrho+1,k) + 1;
          end
        end
      end
    end
  end
  size(accumulator)