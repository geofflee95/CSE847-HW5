function [prinComponents, weightCols] = mypca(A, numComponentsToKeep)

    weightCols = zeros(numComponentsToKeep, size(A,2));
    prinComponents = zeros(size(A,1), numComponentsToKeep);
    [U,S,V] = svd(A,'econ');
    U = U(:,1:numComponentsToKeep);
    S = S(1:numComponentsToKeep,1:numComponentsToKeep);
    V = V(:,1:numComponentsToKeep);
    prinComponents = U;
    weightCols = S*V';

end