function [ simout ] = model2sim( args, time, ic) %#ok<*INUSL,*INUSD>
%MODEL2SIM Summary of this function goes here
%   Detailed explanation goes here

simout = 0;
inp = args;

if nargin < 1
    error('args is a required input!')
end

if nargin < 2
    time = 10; ic = [0 0 0 0];
end

if nargin < 3
    ic = [0 0 0 0];
end

u0 = ic(1);
du0 = ic(2);
y0 = ic(3);
dy0 = ic(4);

options = simset('SrcWorkspace','current');
sim('model2', time, options)

end

