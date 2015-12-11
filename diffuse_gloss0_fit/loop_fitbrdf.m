%% Fits rho_s and alpha using a gridsearch

function loop_fitbrdf(iter)

% init 2 param fitting
LB = [0.0];
UB = [1.0];


bestParams = [];
bestfit_1pr = [];

fitname1 = '0percent_params.mat';

for i = 1:iter
    
    [XBest, BestF] = gridsearch(@renderIm_2params, LB, UB, 5, 0.5, 1e-4, 10, 1, 1);
    sprintf('This is XBest:');
    XBest;
    bestParams = [bestParams;XBest];
    bestfit_1pr = [bestfit_1pr;BestF];

    
    imname = strcat('/scratch/gk925/fast_Wendy_brdf_fitting_spray/diffuse_gloss0_fit/fit_results/multispectral/', fitname1);
    save(imname, 'bestParams','bestfit_1pr');
    
end

return;
