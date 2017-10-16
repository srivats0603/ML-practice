%test KNN
clear
clc

%this is single dimension
for i = 1:1000
    x(i) = -1+2*rand;
    %x(i) = rand;
    y(i) = exp(-8*(x(i)^2))+0.0025*randn;
end
scatter(x,y)
hold all

%knn search based regression
count = 0
for i = -1:0.05:1
    count = count+1;
    X(count) = i;
    %Y(count) = exp(-8*(i^2));
end
xColumnVec = x';
yColumnVec = y';
xTgt = X';
[IDX,D] = knnsearch(xColumnVec,xTgt);
xEstKNN = xColumnVec(IDX);
yEstKNN = yColumnVec(IDX);
plot(xTgt,yEstKNN,'color','r')
grid;
legend('scatter original data','KNN fit');
figure(2);
plot(xTgt,xEstKNN)
test = [xTgt xEstKNN];
title('relationship between search point & nearest neighbor')

%for 2 dimensions
for i = 1:1000
    xmult = rand([1 2]);
    x1(i) = -1+2*xmult(1);
    x2(i) = -1+2*xmult(2);
    %x(i) = rand;
    ymult(i) = exp(-8*(x1(i)^2 + x2(i)^2))+0.0025*randn;
    xx(i,1) = x1(i);
    xx(i,2) = x2(i);
end
figure(3);
scatter3(x1,x2,ymult)
hold all;

%knn search based regression for 2 dimensions
count = 0;
for i = -1:0.005:1
    count = count+1;
    XX(count,1) = i;
    XX(count,2) = i;
end
xxColumnVec = xx;
yyColumnVec = ymult';
xxTgt = XX;
[IDX_xx,D_xx] = knnsearch(xxColumnVec,xxTgt);
for u = 1: size(IDX_xx)
    xxEstKNN(u,1) = xx(IDX_xx(u),1);
    xxEstKNN(u,2) = xx(IDX_xx(u),2);
    yyEstKNN(u) = yyColumnVec(IDX_xx(u));   
end
plot3(xxTgt(:,1),xxTgt(:,2),yyEstKNN)
test2 = [XX xxEstKNN];
figure(4);
plot(xxTgt(:,1),D_xx)
grid
figure(5);
plot(xTgt,D,'color','r')
grid
        


