function prototype = create_prototype(nProt,xRange,yRange)
  protA = nProt(1);
  protB = nProt(2);
  totProt = protA + protB;
  prototype = zeros([totProt,3]);
  prototype(:,1) = xRange(1)+rand(1,totProt)*(xRange(2)-xRange(1));
  prototype(:,2) = yRange(1)+rand(1,totProt)*(yRange(2)-yRange(1));
  for i = 1:protA
    prototype(i,3) = 1;
  end
  for i = 1:protB
    prototype(protA + i,3) = 2;
  end
end