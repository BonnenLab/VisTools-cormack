function sHandle = eSchmear(x, y, u, l, col)
% ESCHMEAR makes an error schmear on the current figure.
%
%	ESCHMEAR(X,Y,E) makes a +/- E shcmear around the data
%	ESCHMEAR(X,Y,U,L) schmear goes from Y+U to Y-L
%	SH = ESCHMEAR(...) returns a handle to the schmear patch object
%     
%   nota bene: you can use eSchmear to plot transparent lines by passing a
%   suitably small value for E
%
% see also: 
% 
% Lawrence K. Cormack

% history:
% 8/17/14  lkc Wrote it.
% 11/26/14 klb added colors and alpha



if (nargin < 3) || (nargin > 5)
    error('inputs = x,y,u,l or x,y,e');
elseif nargin == 3
    l = u;
    col = 'r';
elseif nargin == 4
    col = 'r';
    % 4 args, do nothing 
end

if isempty(l)
    l=u;
end

% make everybody row vectors
x = reshape(x, 1, numel(x));
y = reshape(y, 1, numel(y));
u = reshape(u, 1, numel(u));
l = reshape(l, 1, numel(l));

xe = [x, fliplr(x)];
ye = [y+abs(u) fliplr(y-abs(l))];

if isstr(col)
    sHandle = fill(xe,ye,col);
else
    sHandle = fill(xe,ye,'r');
    set(sHandle,'FaceColor',col);
end
set(sHandle, 'EdgeColor', 'none');
% set(sHandle, 'FaceAlpha', 0.4);

