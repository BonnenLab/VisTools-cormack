function A = ggrate(n, f, p, c, cal, r, ir, or)
%
%   GGRATE makes a 2D grating function with the option of a raised cosine.
%
%	GGRATE(N) makes an NxN grating w/ defaults
%	GGRATE(N,F) makes ggrate with frequency f
%	GGRATE(N,F,P) shifts the carrier phase by p degrees
%	GGRATE(N,F,P,C) set the contrast to c
%	GGRATE(N,F,P,C,CAL) uses cal(1) and cal(2) as viewing distance in cm.
%                           and ppd
%	GGRATE(N,F,P,C,CAL,R) rotates the gabor by r degrees
%                           (requires image processing toolbox)
%	GGRATE(N,F,P,C,CAL,R,ir,or) sets the inner/outer radius of the
%	raised cosine

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
    ir = n/2;
    or = n/2;
elseif nargin == 1,
	r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
	f = 3;
    ir = n/2;
    or = n/2;
elseif nargin == 2,
	r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
    ir = n/2;
    or = n/2;
elseif nargin == 3,
    ir = n/2;
    or = n/2;
    r = 0;
	cal = [57.3, 72];
	c = 1;
	p = 0;
elseif nargin == 4,
	ir = n/2;
    or = n/2;
    r = 0;
	cal = [57.3, 72];
	c = 1;
elseif nargin == 5,
	ir = n/2;
    or = n/2;
	r = 0;
elseif nargin == 6,
	ir=n/2;
    or = n/2;
elseif nargin == 7,
	or = ir;
elseif nargin == 8,
	%do nothing
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

% %	*** make the gaussian window ...
C = coswin(n,ir,or);	

%	*** and make the gabor.
A = .501+0.5*(B.*C);

return

