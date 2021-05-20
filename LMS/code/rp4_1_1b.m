clear
x=linspace(-5,5);
y1=-3/7*x+2/7;
y2=4/5*x-3/5;
xd=31/43;
yd=-1/43;
xi=0;
yi=-4;
plot(x,y1, 'K-.',x,y2, 'K--',xd,yd,'Ko',xi,yi,'K*');
title('LMS');
legend('L1','L2','desired','initial');
hold on
while abs(xi-xd)>0.01 && abs(yi-yd)>0.01
    ex=xd-xi;
    ey=yd-yi;
    xi=xi+2*0.01*ex*1;
    yi=yi+2*0.01*ey*1;
    plot(xi,yi,'K*')
    pause(0.1)
end
hold off
fprintf(1,'x = %g, y = %g',xi,yi);