%test KNN
clear
clc
for i = 1:1000
    %x(i) = -1+2*rand;
    x(i) = rand;
    y(i) = exp(-8*(x(i)^2))+0.0025*randn;
end
scatter(x,y)
hold all

%perform linear regression on x,y
Yreg = y';
Xreg = [ones(size(x))
        x
        x.^2
        x.^3
        x.^4
        x.^5]';
b = inv(Xreg'*Xreg)*Xreg'*Yreg
yest = Xreg*b;
res = Yreg-yest;
%bt = -inv(x'*x)*x'*res+b
%yt = x*bt;
%figure(3);
scatter(x,yest)

%knn search based regression
count = 0
for i = 0:0.05:1
    count = count+1;
    X(count) = i;
    %Y(count) = exp(-8*(i^2));
end
xColumnVec = x';
yColumnVec = y';
xTgt = X';
IDX = knnsearch(xColumnVec,xTgt);
xEstKNN = xColumnVec(IDX);
yEstKNN = yColumnVec(IDX);
%figure(2)
plot(xTgt,yEstKNN,'color','k')
grid;
legend('scatter original data','least squares fit', 'KNN fit');
% figure(2);
% plot(xTgt,xEstKNN)
test = [xTgt xEstKNN];
