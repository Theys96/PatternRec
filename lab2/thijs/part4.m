function void = part1(show_normal_model);
    it     = 1000000;
    rounds = 100;
    
    scores = zeros(rounds,1);
    
    rng('default');
    for person = 1:it
        score = 0;
        for turn = 1:rounds
            if randn > 0
                score = score + 1;
            end
        end
        scores(score) = scores(score) + 1;
    end
    
    labels = 1:rounds;
    mu = sum(labels*scores)/it
    sigma = var(labels, scores)
    
    hold on
    xlabel('Score');
    ylabel('Number of people');
    title({sprintf('Simulation of %d people playing %d rounds of heads/tails', it, rounds);sprintf('{mean=%.3f, variance=%.3f}', mu, sigma)});
    plot(labels, scores, 'r-o', 'LineWidth',2);
    if show_normal_model
        plot(labels, it*normpdf(labels, mu, sqrt(sigma)), 'k--', 'LineWidth',2);
    end
end