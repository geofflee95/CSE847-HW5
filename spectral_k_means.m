%% spectral relaxed k means
function [cluster_assignment] = spectral_k_means(data, k, sigma)

[n, d] = size(data)

cluster_assignment = zeros(n, 1);

% matrix A
matrix_A = zeros(n, n);
for i=1:n
    for j = 1:n
        if (i == j)
            matrix_A(i, j) = 0;
            continue;
        end
        distance_ij = sqrt( sum( (data(i, :) - data(j, :)).^2 ) );
        matrix_A(i, j) = exp(-distance_ij/(2*sigma^2));
    end
end

% matrix D
matrix_D = zeros(n, n);
for i = 1:n
    matrix_D(i, i) = sum(matrix_A(i, :));
end

%matrix L
matrix_L = zeros(n, n);
for i=1:n
    for j = 1:n
        matrix_L(i, j) = matrix_A(i,j) / (sqrt(matrix_D(i,i)) * sqrt(matrix_D(j,j))); 
    end
end

%matrix X
[eigenvectors, eigenvalues] = eig(matrix_L);
matrix_X = zeros(n, k);
size_eigenvectors = size(eigenvectors(1,:));
size_eigen = size_eigenvectors(1, 2);
matrix_X(:, :) = eigenvectors(:, size_eigen-k+1:size_eigen);

%matrix Y
matrix_Y = normc(matrix_X);

cluster_assignment = k_means(matrix_Y, k);

end