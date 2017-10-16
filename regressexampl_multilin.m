%multi- linear regression
clear
clc
% x = [1 1
%      1 2
%      1 3
%      1 4
%      1 5
%      1 6];
count = 0;
for i =1:0.05:6
    count = count+1;
    x(count,1) = 1;
    x(count,2) = i;
    x(count,3) = i^2;
    y(count) = x(count,2)^2+0.5*randn;
end
y = y';% y = [1 2.1 2.8 3.7 5.1]';
b = inv(x'*x)*x'*y
yest = x*b;
res = y-yest;
bt = -inv(x'*x)*x'*res+b
yt = x*bt;
figure(1);
plot(x(:,2),yest)
hold all
scatter(x(:,2),y)
% plot(x(:,2),yt)
grid
legend('multi-linear fit', 'data')
  
