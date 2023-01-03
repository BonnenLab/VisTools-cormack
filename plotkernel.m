function varargout = plotkernel(k, sf, varargin)
% function varargout = plotkernel(kernel, scalefactor, varargin)
% increases the resolution of a classification image for plotting vector
% graphics
% varargin = {xvector, yvector}
% xvector is a vector of x values
% yvector is a vector of y values
% (c) JLY 2012

im  = imresize(k, sf, 'nearest');
sim = size(im);

if nargin == 4  
    mx = [min(varargin{1}) max(varargin{1})];
    my = [min(varargin{2}) max(varargin{2})];
    x = linspace(mx(1),mx(2), sim(2));
    y = linspace(my(1),my(2), sim(1));
else
    x = linspace(1,sim(2), sim(2));
    y = linspace(1,sim(1), sim(1));
end

d.im = im;
d.h   = imagesc(x,y,im);
out   = struct2cell(d);
if nargout > 0
   varargout = out(1:nargout);
end
    

