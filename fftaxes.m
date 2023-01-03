function [f inds] = fftaxes(nsamps, fs, halfflag, logflag)
%
% FFTAXES makes a reasonable frequency axis for plotting FFTs.
% 
% usage:
%	FFTAXES(NSAMPS, FS) computes a 2-sided frequency axis for a signal
%       NSAMPS long with a sampling frequency of FS
%	FFTAXES(NSAMPS, FS, HALFFLAG) makes a 1-sided axis if halfflag is true
%	FFTAXES(NSAMPS, FS, HALFFLAG, LOGFLAG) log10 frequency omitting DC
%   
%   [F INDS] = FFTAXES(NSAMPS, ...)  returns the indices into your (dc
%   centered) spectrum.  For example, if your nsamps long signal is s, then
%       myspec = fftshift(abs(fft(s))); 
%       plot(f, myspec(inds));
%   will give you a pretty frequency-domain plot
%
% f is in the units of cycles/whatever given that fs is in units of
% samples/whatever, e.g. if fs is sample/sec, then f is in Hz
%
% see also:  fft, fftshift, abs
% 
% Lawrence K. Cormack

% history:
% 3/21/12   lkc Wrote it.
%

% givens (eventually args)
% nsamps = 702;          % number o samples in signal
% fs = 250;            % sampling rate in Hz
if nargin < 3
    halfflag = 0;
    logflag = 0;
elseif nargin < 4
    logflag = 0;
end

% basic numbers
rectime = nsamps/fs;   % length of signal in seconds
fres = 1/rectime;      % freq. resolution in Hz
nyq = fs/2;            % nyquist limit in Hz

% le axis du frequency
f = 0:fres:nyq;
% if even, f is nsamps/2 + 1 long, and there is one more neg than pos freq
% if odd, it is ceil(nsamps/2) long and dc is smack in the middle
fneg = -nyq:fres:-fres;
f = [fneg, f];
dcloc = ceil(nsamps/2);
if iseven(nsamps)
    f(end) = [];
    dcloc = nsamps/2 + 1;
end

inds = 1:nsamps;

if halfflag
    % pick off the left half of the spectrum and plot it
    f(dcloc+1:end) = [];
    f = abs(fliplr(f));
    % ditto with the signal
    
    inds = dcloc:-1:1;   % indexes into the neg freqs in original spectum    
end

if logflag
    f = log10(f(2:end));
    inds = inds(2:end);
end