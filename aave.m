function y=aave(x)% AAVE % aave(x) computes the mean of all elements of x, regardless of% dimensionality%% Lawrence K. Cormack%% lkc back/inthe/day  wrote it% lkc 10/Jul/2012 made header commments % ktz 03/Jan/2013 added NaN-handling capabilities (changed 'mean' to 'nanmean'..)y = nanmean(x(:));