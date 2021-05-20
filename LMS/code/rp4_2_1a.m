clear
x=linspace(-5,5);
y1=-12/27*x+6/27;
y2=7/19*x+27/19;
y3=43/21*x-3;
xd=379140038229812576256/421594571197108766725;
yd=1349486509042492783616983/1686378284788435066900000;
xi=-4;
yi=-10;
plot(x,y1, 'K-.',x,y2, 'K--',x,y3,'K-',xd,yd,'Ko',xi,yi,'K*');
title('LMS');
legend('L1','L2','L3','desired','initial');
hold on
while abs(xi-xd)>0.01 && abs(yi-yd)>0.01
    ex=xd-xi;
    ey=yd-yi;
    xi=xi+2*0.2*ex*1;
    yi=yi+2*0.2*ey*1;
    plot(xi,yi,'K*')
    pause(0.1)
end
hold off
fprintf(1,'x = %g, y = %g',xi,yi);
