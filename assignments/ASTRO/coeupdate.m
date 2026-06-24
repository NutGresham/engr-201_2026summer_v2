function [COE_f] = coeupdate(COE_i, mu, tof) 
% 
% Propogate COE forward in time (time of flight). 
% 
% ## author
% 
% Lt Col Jordan Firth
% jordan.firth@afacademy.af.edu/
% USAFA/DFAS
% 
% 2024-08
% 
% ## inputs
% 
% | symbol | ASCII | description                          | units      | value/range                                                  |
% | ------ | ----- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
% |        | coe   | variable of class `satellite_COE`    |            | see [`../functions/satellite_COE.m`](../functions/satellite_COE.m) |
% |        | tof   | time of flight                       | s          | real                                                         |
% | μ      | mu    | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth)                                         |
% 
% ## outputs
% 
% coe: One instance of class `satellite_COE` with the following properties; see [`../functions/satellite_COE.m`](../functions/satellite_COE.m)
% 
% | symbol | ASCII    | description         | units | value/range     |
% | ------ | -------- | ------------------- | ----- | --------------- |
% | a      | coe.a    | semi-major axis     | km    | positive        |
% | e      | coe.ecc  | eccentricity        | N/A   | 0 <= ecc < 1    |
% | i      | coe.inc  | inclination         | rad   | 0 <= inc < pi   |
% | Ω      | coe.RAAN | RAAN                | rad   | 0 <= inc < 2 pi |
% | ω      | coe.argp | argument of perigee | rad   | 0 <= inc < 2 pi |
% | ν      | coe.nu   | true anomaly        | rad   | 0 <= inc < 2 pi |
% 
% ## constants
% 
% none
% 
% ## coupling
% 
% newton.m to solve kepler’s problem
% SATELLITE_COE.m
% 
% ## assumptions
% 
% 2 body motion, fixed central body
% 
% - a, e, i, Ω, ω fixed
% 
% ## references
% 
% none
% 
% ## process
% 
% because of assumptions, some elements do not change

if ~isa(COE_i, 'SATELLITE_COE')
    error('input COE must be a variable of class SATELLITE_COE')
end

% 2-body assumptions--5 COEs remain constant
COE_f = COE_i; 
COE_f.nu = []; % remove wrong nu to avoid confusion

% update future datetime--add time of flight
COE_f.datetime = COE_i.datetime + seconds(tof); 

% find future true anomaly
% part of this multi-step process will involve newton.m




end  % function `coeupdate`
