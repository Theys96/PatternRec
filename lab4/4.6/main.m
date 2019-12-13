studentNr = 's2922924'

% Q1
I = imread('dogGrayRipples.png');
I = im2double(I);
f = fft2(I);
fs= fftshift(f);
f = abs(fs);
f = log(1+f);
imshow(f,[]);

% Q5
[x, y] = find(f==max(f));
% Q4
r = 13;

% Q3
rows = size(f,1),cols = size(f,2),radius = r,center = [x'; y'];
mask=zeros(size(f));
[xMat,yMat] = meshgrid(1:cols,1:rows);
for i = 1:size(center,2)
    distFromCenter = sqrt((xMat-center(1,i)).^2 + (yMat-center(2,i)).^2);
    mask(distFromCenter<=radius)=1;
end
figure, imshow(~mask,[]);title('Mask')

Q6 = center(1,1)
Q7 = center(2,1)
Q8 = center(1,2)
Q9 = center(2,2)

% Q10
fs=fs.*(~mask);
f = ifftshift(fs);
I = real(ifft2(f));
figure, imshow(I, []), title(studentNr);


