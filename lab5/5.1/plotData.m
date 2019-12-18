function plotData(X, P)
    scatter(X(X(:,3) == 1,1), X(X(:,3) == 1,2), 'DisplayName', 'Class A');
    hold on
    scatter(X(X(:,3) == 2,1), X(X(:,3) == 2,2), 'DisplayName', 'Class B');
    if exist('P','var')
        scatter(P(P(:,3) == 1,1), P(P(:,3) == 1,2), 'filled', 'DisplayName', 'Prototypes A');
        scatter(P(P(:,3) == 2,1), P(P(:,3) == 2,2), 'filled', 'DisplayName', 'Prototypes B');
    end
    xlabel('Feature 1');
    ylabel('Feature 2');
    legend;
    hold off;
end
