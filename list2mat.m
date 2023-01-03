function [levels, vals] = list2mat(x, ys)
% LIST2MAT
% [levels, vals] = list2mat(x, ys)
%
% makes a table of thresholds vs. (unique) stimulus level
%
% Thresholds for each stimulus value are listed in the rows.  The number of
% columns is equal to the max number of threshold estimates in any of the
% rows; rows with fewer values will contain NaNs.
%
% see also: 
%
% Lawrence K. Cormack

% 04/04/2014  lkc Wrote it.

levels = unique(x);
nLevels = numel(levels);
nPointsAtLevel = zeros(size(levels));

for ii = 1:nLevels
    nPointsAtLevel(ii) = sum(x==levels(ii));
end

vals = ones(nLevels, max(nPointsAtLevel));
vals(:) = NaN;

for ii = 1:nLevels
    vals(ii, 1:nPointsAtLevel(ii)) = ys(x==levels(ii))';
end


