function [ ] = data2graphs( data, type )
%DATA2GRAPHS Summary of this function goes here
%   Detailed explanation goes here

if strcmp(type, 'simscape1')
    name = 'Simscape - 1st generation';
elseif strcmp(type, 'simscape2')
    name = 'Simscape - 2nd generation';
elseif strcmp(type, 'linerized')
    name = 'Linearized';
elseif strcmp(type, 'diff')
    name = 'Differential equations';
end
    
time = data.Time;

if strcmp(type, 'simscape1')
    positionU = data.Data(:,1);
    velocityU = data.Data(:,4);
    positionY = data.Data(:,7);
    velocityY = data.Data(:,10);
elseif strcmp(type, 'linerized')
    positionU = data.Data(:,1);
    velocityU = data.Data(:,2);
    positionY = data.Data(:,3) + 1;
    velocityY = data.Data(:,4);
else
    positionU = data.Data(:,1);
    velocityU = data.Data(:,2);
    positionY = data.Data(:,3);
    velocityY = data.Data(:,4);
end

figure

subplot(2,1,1);
plot(time, positionU, '--r', time, positionY, 'b')
title([name, ' model position'])
ylabel('Position')
xlabel('Time')
legend('Cart u', 'Cart y')

subplot(2,1,2);
plot(time, velocityU, '--r', time, velocityY, 'b')
title([name, ' model velocity'])
ylabel('Velocity')
xlabel('Time')
legend('Cart u', 'Cart y')

end

