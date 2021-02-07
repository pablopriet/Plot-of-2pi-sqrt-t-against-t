figure(1)
period = [0.872,0.911,0.949,0.980,1.02];
twopisqrt = sqrt(period) * 2*pi;
err = [0.001 0.001 0.003 0.002 0.002]; 
errorbar(twopisqrt,period,err,'xk')
title('2\pi\surdT vs. T')
xlabel('2\pi\surdT values')
ylabel('Period,T values (seconds)')
xticks([twopisqrt(1) twopisqrt(2) twopisqrt(3) twopisqrt(4) twopisqrt(5)])
xlim([5.8 6.4])
yticks([period(1) period(2) period(3) period(4) period(5)])
xline = [5.8673 6.3457];
yline = [0.871 1.022];
hold on
plot(xline,yline,'-k')
xline2 = [5.8673 6.3457];
yline2 = [0.873 1.018];
plot(xline2,yline2,'-k')
xline3 = [5.8673 6.3457];
yline3 = [0.872 1.02];
plot(xline3,yline3,'-k')
% line of best fit using least squares
[p,PolyS] = polyfit(twopisqrt,period,1);
xline = [5.8673 6.3457];
yline = [polyval(p,min(twopisqrt)),polyval(p,max(twopisqrt))];
plot(xline,yline,'-k')
COVB = (PolyS.R'*PolyS.R)\eye(size(PolyS.R)) * PolyS.normr^2/PolyS.df;
% SE  is the error of the line of best fit
SE = sqrt(diag(COVB))                              