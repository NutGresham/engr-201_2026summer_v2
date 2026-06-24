function [RV] = coe_to_rv(COE, mu)
% RandV
% [RV] = RandV(coe, mu)
% 
% Calculate spacecraft position and velocity from COEs
% 
% ## author
% 
% Lt Col Jordan Firth
% jordan.firth@afacademy.af.edu
% USAFA/DFAS
% 
% 2024-08
% 
% ## inputs
% 
% | symbol | ASCII | description                          | units      | value/range                                                  |
% | ------ | ----- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
% |        | coe   | variable of class `satellite_COE`    |            | see [`../functions/satellite_COE.m`](../functions/satellite_COE.m) |
% | μ      | mu    | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth)                                         |
% 
% 
% 
% ## outputs
% 
% | symbol | ASCII | description                          | units      | value/range                                                  |
% | ------ | ----- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
% |        | RV    | variable of class `satellite_RV`     |            | see [`../functions/satellite_RV.m`](../functions/satellite_RVCOE.m) |
% | μ      | mu    | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth)                                         |
% 
% 
% 
% ## coupling
% 
% `SATELLITE_RV.m` 
% 
% ## references
% 
% none
% 
% ## process
% 
% create empty instance of satellite_RV class
% 

% input validation
if ~isa(COE, 'SATELLITE_COE')
    error('input COE must be a variable of class SATELLITE_COE')
end

RV = SATELLITE_RV(); 
RV.name = COE.name; 
RV.datetime = COE.datetime; 

% find satellite R & V in the IJK frame
RV.R = 
RV.V = 


end % function RandV