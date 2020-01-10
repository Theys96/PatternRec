function index = locate_value(value,array)
  sz = size(array,2);
  %start
  if value <= min(array)
    index = 1;
  elseif value > max(array)
    error('value must be in [0,max(array)]');
  else %otherwise search for the proper location in the array
  i = 2;
  while i <= sz
    if value <= array(i) && value > array(i-1)
      index = i;
      break;
    end
    i = i+1;
  end
end