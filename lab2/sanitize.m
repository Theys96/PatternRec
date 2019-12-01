function sanitized = sanitize(text)
%SANITIZE Takes a string of text and returns an array of lowercase words
    text = erase(text, '.');
    text = erase(text, '!');
    text = erase(text, '?');
    text = erase(text, ',');
    text = erase(text, '(');
    text = erase(text, ')');
    text = erase(text, '"');
    text = erase(text, "'");
    text = lower(text);
    sanitized = strsplit(text, ' ');
end

