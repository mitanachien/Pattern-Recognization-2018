clear
x=linspace(-5,5);
y1=-12/27*x+6/27;
y2=7/19*x+27/19;
y3=43/21*x-3;
xi=4;
yi=-13;
plot(x,y1, 'K-.',x,y2, 'K--',x,y3,'K-',xi,yi,'K*');
title('LMS');
legend('L1','L2','L3','desired','initial');
I1=27*xi-12*yi;
I2=19*xi+7*yi;
I3=21*xi+43*yi;
A1=[27 -12;12 27];
C1=[I1;6];
X1=A1\C1;
A2=[19 7;-7 19];
C2=[I2;27];
X2=A2\C2;
A3=[21 43;-43 21];
C3=[I3;-63];
X3=A3\C3;
hold on
while abs(abs(xi-X1(1))-abs(xi-X2(1)))>0.04 && abs(abs(xi-X2(1))-abs(xi-X3(1)))>0.04 &&...
        abs(abs(xi-X3(1))-abs(xi-X1(1)))>0.04 &&...
        abs(abs(yi-X1(2))-abs(yi-X2(2)))>0.04 && abs(abs(yi-X2(2))-abs(yi-X3(2)))>0.04 &&...
        abs(abs(yi-X3(2))-abs(yi-X1(2)))>0.04
    I1=27*xi-12*yi;
    A1=[27 -12;12 27];
    C1=[I1;6];
    X1=A1\C1;
    ex1=X1(1)-xi;
    ey1=X1(2)-yi;
    xi=xi+2*0.2*ex1*1;
    yi=yi+2*0.2*ey1*1;
    plot(xi,yi,'K*')
    pause(0.1)
    I2=19*xi+7*yi;
    A2=[19 7;-7 19];
    C2=[I2;27];
    X2=A2\C2;
    ex2=X2(1)-xi;
    ey2=X2(2)-yi;
    xi=xi+2*0.2*ex2*1;
    yi=yi+2*0.2*ey2*1;
    plot(xi,yi,'K*')
    pause(0.1)
    I3=21*xi+43*yi;
    A3=[21 43;-43 21];
    C3=[I3;-63];
    X3=A3\C3;
    ex3=X3(1)-xi;
    ey3=X3(2)-yi;
    xi=xi+2*0.2*ex3*1;
    yi=yi+2*0.2*ey3*1;
    plot(xi,yi,'K*')
    pause(0.1)
end
hold off
fprintf(1,'x = %g, y = %g',xi,yi);
