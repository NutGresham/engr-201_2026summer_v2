function [COE] = rv_to_coe(RV, mu) 
% orbital_elements
% [coe] = orbital_elements(RV, μ) 
% Calculates orbital elements from position and velocity vectors 

% ## author
% 
% Lt Col Jordan Firth
% jordan.firth@afacademy.af.edu
% 
% USAFA/DFAS
% 
% 2024-07
% 
% ## inputs
% 
% position and velocity vector for a single satellite state
% 
% |      | description                          | units      | value/range          |
% | ---- | ------------------------------------ | ---------- | -------------------- |
% | R    | 3-element position vector            | km         | real                 |
% | V    | 3-element velocity vector            | km/s       | real                 |
% | mu   | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth) |
% 
% ## outputs
% 
% coe: One set of satellite classical orbital elements with the following properties
% 
% |          | description         | units | value/range     |
% | -------- | ------------------- | ----- | --------------- |
% | coe.a    | semi-major axis     | km    | positive        |
% | coe.ecc  | eccentricity        | N/A   | 0 <= ecc < 1    |
% | coe.inc  | inclination         | rad   | 0 <= inc < pi   |
% | coe.RAAN | RAAN                | rad   | 0 <= inc < 2 pi |
% | coe.argp | argument of perigee | rad   | 0 <= inc < 2 pi |
% | coe.nu   | true anomaly        | rad   | 0 <= inc < 2 pi |
% 
% ## constants
% 
% none
% 
% ## coupling
% hnevec.m: calculate orbit’s H, N, E vectors
% sizeshape.m: calculate orbit’s a, ecc
% angles.m: calculate orbit’s angles (inc, RAAN, argp, nu)
% SATELLITE_COE.m
% SATELLITE_RV.m
% 
% ## references
% none
% 
% ## process

% input validation
if ~(isa(RV, 'SATELLITE_RV'))
    error('input RV must be a variable of class SATELLITE_RV')
end

COE = SATELLITE_COE; 

COE.name = RV.name; 
COE.datetime = RV.datetime; 

% find classical orbital elements

COE.a = 
COE.ecc = 
COE.inc = 
COE.RAAN = 
COE.argp = 
COE.nu = 

end % function orbital_elements