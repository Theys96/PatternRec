function void = lab5()
    mu1 = [3 5];
    mu2 = [2 1];
    
    xlim([-10 20]);
    ylim([-10 20]);
    hold on;
    
    %scatter(mu1(1), mu1(2), '.');
    %scatter(mu2(1), mu2(2), '.');
    %plot([mu1(1)-1 mu1(1)+1], [mu1(2) mu1(2)]);
    %plot([mu1(1) mu1(1)], [mu1(2)-4 mu1(2)+4]);
    %plot([mu2(1) mu2(1)], [mu2(2)-1 mu2(2)+1]);
    %plot([mu2(1)-2 mu2(1)+2], [mu2(2) mu2(2)]);
    
    title('Decision boundary')
    f = @(x,y) -0.25.*x.^2 + 0.375.*y.^2 + 2.*x + 0.25.*y - 7.31887;
    fimplicit(f, 'Color', '#A2142F', 'LineWidth', 2)
end