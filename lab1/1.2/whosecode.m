function [test_person,significance] = whosecode(codes,testcode)
unmissing_idx = find(testcode==1 | testcode==0); %find missing bits to exclude them
missing_count = size(find(testcode==2),2)
HDmeans = [];
for person = 1:20  
    HDs = [];
    for row = 1:size(codes,1) %compare test person's only available iris code with each of other persons'
        hamming = HD(testcode(unmissing_idx),codes(row,unmissing_idx,person));
        HDs = [HDs hamming];
    end
    hammean = mean(HDs); %for each person, the across codes (rows) average HD is stored
    HDmeans = [HDmeans hammean];
end
mean_HDt = mean(HDmeans);
var_HDt = var(HDmeans);
test_person = find(HDmeans==min(HDmeans),2) %test person most likely has the lowest HD in the array
significance = normcdf(HDmeans(test_person),mean_HDt,sqrt(var_HDt)) %integral of the left tail
end
