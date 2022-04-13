%% clustering k-means and spectral relaxed k-means
clc;
close all;
clear all;
data = []
data = [data; randi(20, 100, 2)];
data = [data; randi([30,60], 100, 2)];
data = [data; randi([70, 100], 100, 2)];
data = [data; randi(100, 100, 2)];
data = data ./ 100;

scatter(data(:, 1), data(:, 2));

save("data.mat", "data");

number_point = 500;
left_data = randi([0,100], number_point, 2);
middle_data = randi([200,400], number_point, 2);
right_data = randi([500,800], number_point, 2);
data = [left_data;middle_data;right_data];
save("data2.mat", "data");

theta = 1:360;
x0 = 5;
y0 = 5;
r = randi(5, 3, 1);
x = [x0+r(1)*cosd(theta) x0+r(2)*cosd(theta) x0+r(3)*cosd(theta)];
y = [y0+r(1)*sind(theta) y0+r(2)*sind(theta) y0+r(3)*sind(theta)];
data = [x' y'];
save("data3.mat", "data");