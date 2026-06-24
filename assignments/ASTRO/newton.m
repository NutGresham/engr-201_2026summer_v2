function [E] = newton(ecc, M) 
% newton
% E = newton(ecc, M)
% Solves Kepler's equation with Newton's method. 

% ## author
% Lt Col Jordan Firth
% jordan.firth@afacademy.af.edu
% USAFA/DFAS
% 
% 2025-09
% 
% ## inputs
% 
% | symbol | variable name | description  | units    | value/range |
% | ------ | ------------- | ------------ | -------- | ----------- |
% | $e$    | ecc           | eccentricity | unitless | 0 < e < 1   |
% | $M$    | M             | mean anomaly | rad      | 0 ≤ M < 2π  |
% 
% ## outputs
% 
% | symbol | variable name | description       | units | value/range |
% | ------ | ------------- | ----------------- | ----- | ----------- |
% | $E$    | E             | eccentric anomaly | rad   | 0 ≤ E < 2π  |
% 
% 
% 
% ## references
% https://arxiv.org/abs/2108.03215
% 
% ## constants
% convergence criteria
​	conv = 1e-8;
% 
% ## procedure
%
% Initial guess is always pi to avoid numerical/convergence problems. 
% This will converge to 10^-12 within 7 iterations. See reference. 
% 
% set intial value of variable `diff` such that 
% the algorithm will run at least once
% 
% loop until convergence criteria met
% 
% assign final iteration to function output

