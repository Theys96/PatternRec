function [colors,shapes] = colors_shapes(k)
  red = [1 0 0];
  blue = [0 0 1];
  cyan = [0 1 1];
  magenta = [1 0 1];
  black = [0 0 0];
  ocra = [0.9290 0.6940 0.1250];
  purple = [0.4940 0.1840 0.5560];
  green = [0.4660 0.6740 0.1880];
  
  if k == 2
    colors = [red; blue];
    shapes = ['o' 'x'];
  elseif k == 4
    colors = [red; blue; purple; green];
    shapes = ['o' 'x' 's' 'd'];
  elseif k == 8
    colors = [red; blue; purple; green; black; magenta; ocra; cyan];
    shapes = ['o' 'x' 's' 'd' '*' 'h' '^' 'v'];
  else
    error('please select another value of k')
  end
end