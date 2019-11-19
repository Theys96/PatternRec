function hamming = HD(v1,v2)
    if (size(v1,2) ~= size(v2,2))
        error('Feature vectors must have the same size')
    end
    hamming = 0;
    for i = 1:size(v1,2) %count unmatching bits
        if v1(i)~=v2(i)
            hamming = hamming+1;
        end
    end
    hamming = hamming/size(v1,2); %normalization
end