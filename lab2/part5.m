function void = lab5()
    mu1 = [3 5];
    mu2 = [2 1];
    
    xlim([0 10]);
    ylim([0 10]);
    hold on;
    
    scatter(mu1(1), mu1(2));
    scatter(mu2(1), mu2(2));
    plot([mu1(1) mu1(1)+1], [mu1(2) mu1(2)]);
    plot([mu1(1) mu1(1)], [mu1(2) mu1(2)+4]);
    plot([mu2(1) mu2(1)], [mu2(2) mu2(2)+1]);
    plot([mu2(1) mu2(1)+2], [mu2(2) mu2(2)]);
end