% BME 271 Fall 2017
% Tremor Reduction for Microsurgical Applications
% trackTask: Master script to track motion and make tremor reducing filter.

function track = trackTask(x,y,ax)

clear global
figure('WindowButtonMotionFcn', @trackPoint)
ah = axes('SortMethod','childorder');
global track; global k; k = 1;
plot(x(1),y(1),'r*')
title('Get your mouse ready!')
axis(ax)
hold on

pause(2)
k = 1;
h = animatedline;
for i = 1:length(x)
    addpoints(h,x(i),y(i));
    drawnow
end

close all;

function tracked = trackPoint(src,callbackdata)
    loc = ah.CurrentPoint;
    track(k,1:2) = [loc(1,1:2)];
    k = k + 1;
    disp(loc(1,1:2))
end

end