clc;
close all;
clear all;

load("data3.mat");

k = 3;
[n, d] = size(data);

cluster_assignment = k_means(data, k);
figure;
gscatter(data(:, 1), data(:, 2), cluster_assignment);
xlabel("X");
ylabel("Y");
title("K-means")

cluster_assignment = spectral_k_means_2(data, 3)
figure;
gscatter(data(:, 1), data(:, 2), cluster_assignment);
xlabel("X");
ylabel("Y");
title("Spectral Relaxed K-means")