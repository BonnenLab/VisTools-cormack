function [myamp, myphi, lefit] = sinFit(data, ncyc)
% SINFIT - fits an ncyc cycle sinusoid to a data vector
% usage: [a, p, y] = sinFit(x) returns the amp, phase, and fit vals
%           [a, p] = sinFit(x) returns the amp & phase
%           sinFit(x) plots the data and fit
%       Returned phase is in radians

% lkc 16/Mar/2011 wrote it 
% lkc 22/Mar/2012 accepts row or col vecs; handles dc of input

%% preliminaries
[r c] = size(data);
if r>c 
    data = data'; 
end
n = length(data);
xrad = linspace(0,ncyc.*2.*pi,n);  % x axis in radians

% make the canonical sine and cosine
mysin = sin(xrad);
mycos = cos(xrad);

%% do the fitting

tempData = data - mean(data);   % subtract the dc! 
% Fourier's theorem + help from Euler's theorem
dx = 2./n;
myreal = sum(tempData.*mycos).*dx;
myim = sum(tempData.*mysin).*dx;

% Pythagoras 
myamp = sqrt(myreal.^2 + myim.^2);

% trigonomety (but we need to keep track of what quantrant we're in)
% myphi = atan(myim./myreal);
% ... or we could be lazy and let matlab keep track...
myphi = angle(complex(myreal, myim));

lefit = myamp.*cos(xrad-myphi)+mean(data);

%% plot if called with no output args
if ~nargout  
    plot(data);
    hold on
    plot(lefit, 'r');
    hold off
end
