%% k-means
function [cluster_assignments] = k_means(data, k)
%% get data size
%here per point in one row
%n is number of data, d is dimension
[n, d] = size(data);

%each row contains a cluster k
cluster_assignments = zeros(n, 1);

%% generate random centroids
list = randi(n, k, 1);
centroids = zeros(k, d);
for i = 1:k
    centroids(i, :) = data(list(i), :);
end
%centroids = rand(k, d);
pre_centroids = centroids * 100;

%% do loop for k means
while norm(centroids - pre_centroids) > 0.001
    % put each node to cluster
    for i = 1:n
        point = data(i, :);
        distances = zeros(k, 1);
        for j = 1:k
            distances(j) = sqrt( sum((point-centroids(j, :)).^2) );
        end
        [~, index] = min(distances);
        cluster_assignments(i) = index;
    end

    % calculate new centroids
    pre_centroids = centroids;
    for i=1:k
        points = []
        for j = 1:n
            point = data(j, :);
            if cluster_assignments(j) == i
                points = [points ; point]
            end
        end
        centroids(i, :) = mean(points, 1)
    end
end

end