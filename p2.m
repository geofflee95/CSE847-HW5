clc;
close all;
clear all;

clear;

load USPS.mat;

p_components = [10,50,100,200];
rec_err = [0,0,0,0];

%[coeff, score] = pca(A);
mean_A = A - mean(A);
[u,s,v] = svd(mean_A);
coeff = v;
score = mean_A*coeff;

im1 = reshape(A(100,:),16,16);
im2 = reshape(A(1000,:),16,16);

f = figure();
imshow(im1','InitialMagnification','fit');
title(['Image 1']);

f = figure();
imshow(im2','InitialMagnification','fit');
title(['Image 2']);

for i=1:size(p_components,2)
    p = p_components(i);
    
    pca_im = score(:,1:p)*coeff(:,1:p)';
    mean_im = mean(A);
    
    for j = 1:size(A,1)
       pca_im(j,:) = pca_im(j,:)+mean_im;
    end
    
    n = size(A,1);
    diff = A - pca_im;
    err = zeros(n,1);
    for j = 1:n
        err(j) = norm(diff(j,:),'fro')^2;
    end
    
    im1 = reshape(pca_im(100,:),16,16);
    im2 = reshape(pca_im(1000,:),16,16);
    
    f = figure();
    imshow(im1','InitialMagnification','fit');
    title(['Image 1, p=' num2str(p) ', Error=' num2str(err(1))]);
    saveas(f,['./im0_p' num2str(p) '.png']);
    
    f = figure();
    imshow(im2','InitialMagnification','fit');
    title(['Image 2, p=' num2str(p) ', Error=' num2str(err(2))]);
    saveas(f,['./im3_p' num2str(p) '.png']);
    
    rec_err(i) = sum(err);
    
end

figure;
plot(p_components, rec_err);
xlabel("p");
ylabel("error");
title("error curve")