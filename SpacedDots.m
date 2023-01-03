function coords = SpacedDots(ndots, xsize, ysize)
% SPACEDOTS
% coords = SpaceDots(ndots, xsize, [ysize])
%
% makes a two-row vector of xy positions evenly spaced in 2D
%
% see also: 
%
% Lawrence K. Cormack

% 02/04/2013  lkc Wrote it.

if nargin < 3
    ysize = xsize;
    nDotsX = floor(sqrt(ndots));
    nDotsY = nDotsX;
    xSpacing = floor(xsize./nDotsX);
    ySpacing = xSpacing;
else
    nDotsY = floor(sqrt(ndots.*(ysize./xsize)));
    nDotsX = floor(nDotsY.*(xsize./ysize));
    xSpacing = floor(xsize./nDotsX);
    ySpacing = floor(ysize./nDotsY);
end

nDotsActual = nDotsX.*nDotsY;
coords = zeros(2, nDotsActual);

for j = 1:nDotsY
    for i = 1:nDotsX
        theInd = (j-1).*nDotsX + i;
        coords(1, theInd) = i.*xSpacing;
        coords(2, theInd) = j.*ySpacing;
    end
end

%keyboard;