function A = ggrate2(n, f, p, c, cal, r, ir, or)
%
%   GGRATE makes a 2D grating function 
%
%	GGRATE(N) makes an NxN grating w/ defaults
%	GGRATE(N,F) makes ggrate with frequency f
%	GGRATE(N,F,P) shifts the carrier phase by p degrees
%	GGRATE(N,F,P,C) set the contrast to c
%	GGRATE(N,F,P,C,CAL) uses cal(1) and cal(2) as viewing distance in cm.
%                           and ppd
%	GGRATE(N,F,P,C,CAL,R) rotates the gabor by r degrees
%                           (requires image processing toolbox)
% Kate Bonnen

% history:
% 11/21/2013 - KLB wrote it

%	*** handle the input arguments.  Real code starts	***
%	*** on line 80 										***
if nargin == 0,
    r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
	f = 3;
	n = 256;
elseif nargin == 1,
	r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
	f = 3;
elseif nargin == 2,
	r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
elseif nargin == 3,
    r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
elseif nargin == 4,
    r = 0;
	cal = [57.3, 72];
	c = 1;
elseif nargin == 5,

	r = 0;
else
	error('invalid input arguments');
end	%	***  argument handling
if length(cal) < 2, cal = [57.3, 72]; end;

%	*** do preliminary calcs based on arguments...
degPerCm = r2d( 2.*atan(1./(2.* cal(1))));
cmPerPix = 1/(cal(2)*degPerCm);	
gratfrq = degPerCm * cmPerPix * f; % convert to (cyc/pix) 
p = p * pi/180;

%	*** make the grating and rotate if necessary ...
x = -n/2+.5:n/2-.5;
y = c*sin(2*pi*gratfrq*x+p);
B = buff2arr(y); 
if r ~= 0,
	B = imrotate(B, r, 'bicubic', 'crop');
end

A = .5*B+.501;

return

