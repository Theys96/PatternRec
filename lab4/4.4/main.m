I = imread('HeadTool0002.bmp');
I = im2double(I);
J = adapthisteq(I);

[centers,radii] = imfindcircles(J, [20 40], 'Sensitivity', 0.95)

% Routine for selecting the strongest circles until two of them
% intersect.
n = 1;
indpntCircle = true;
while indpntCircle
    for i = 1:n
        if norm(centers(i,:) - centers(n+1,:)) < radii(i) + radii(n+1)
            indpntCircle = false;
            break
        end
    end
    n = n + indpntCircle;
end

% Q1 (selecting as many bolts as possible)
figure(1);
imshow(J);
viscircles(centers(1:n,:), radii(1:n),'Color','b');

% Q2 (selecting two strongest circles)
figure(2);
imshow(J);
viscircles(centers(1:2,:), radii(1:2),'Color','b');
