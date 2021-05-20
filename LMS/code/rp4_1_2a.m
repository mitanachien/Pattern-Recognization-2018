clear
x=linspace(-5,5);
y1=-3/7*x+2/7;
y2=4/5*x-3/5;
xi=-3;
yi=4;
plot(x,y1, 'K-.',x,y2, 'K--',xi,yi,'K*');
title('LMS');
legend('L1','L2','initial');
I1=7*xi-3*yi;
I2=5*xi+4*yi;
A1=[7 -3;3 7];
C1=[I1;2];
X1=A1\C1;
A2=[5 4;-4 5];
C2=[I2;-3];
X2=A2\C2;
hold on
while abs(xi-X1(1))>0.0001 && abs(yi-X1(2))>0.0001 && abs(xi-X2(1))>0.0001 && abs(yi-X2(2))>0.0001
    I1=7*xi-3*yi;
    A1=[7 -3;3 7];
    C1=[I1;2];
    X1=A1\C1;
    ex1=X1(1)-xi;
    ey1=X1(2)-yi;
    xi=xi+2*0.2*ex1*1;
    yi=yi+2*0.2*ey1*1;
    plot(xi,yi,'K*')
    pause(0.1)
    I2=5*xi+4*yi;
    A2=[5 4;-4 5];
    C2=[I2;-3];
    X2=A2\C2;
    ex2=X2(1)-xi;
    ey2=X2(2)-yi;
    xi=xi+2*0.2*ex2*1;
    yi=yi+2*0.2*ey2*1;
    plot(xi,yi,'K*')
    pause(0.1)
end
hold off
fprintf(1,'x = %g, y = %g',xi,yi);