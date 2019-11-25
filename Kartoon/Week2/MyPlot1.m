t = 0:pi/100:2*pi;
y = sin(t);
plot(t,y)
y2 = sin(t-.25);
y3 = sin(t-.5);
plot(t,y,t,y2,t,y3)
grid