function [nom_spam, nom_notspam] = classify_spam(input)
    prior_spam = 0.9;
    prior_notspam = 0.1;

    words = {'anti-aging', 'customers', 'fun', 'Groningen', 'lecture', 'money', 'vacation', 'viagra', 'watches'};
    p_spam = containers.Map(words, [0.00062 0.005 0.00015 0.00001 0.000015 0.002 0.00025 0.001 0.0003]);
    p_notspam = containers.Map(words, [0.000000035 0.0001 0.0007 0.001 0.0008 0.0005 0.00014 0.0000003 0.000004]);

    text = sanitize(input);

    nom_spam = prior_spam;
    nom_notspam = prior_notspam;
    for word = text
        if any(strcmp(words,word))
            nom_spam = nom_spam * p_spam(word);
            nom_notspam = nom_notspam * p_notspam(word);
        end
    end
end
