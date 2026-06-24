classdef SATELLITE_COE
% satellite_COE
% A variable of class SATELLITE_COE is a single variable that represents
% a complete satellite ephemeris stored as 6 classical orbital elements. 
% It contains the following properties:
%   .name .datetime .a .ecc .inc .RAAN .argp .nu
% units are km, rad

    properties
        name % satellite name (string)
        datetime % datetime of ephemeris
        a {mustBePositive} % km, semi-major axis
        ecc {mustBeInRange(ecc,0,1,"exclude-upper")} 
        inc {mustBeInRange(inc,0, 3.141592653589793)} % rad, eccentricity
        RAAN {mustBeInRange(RAAN,0,6.283185307179586)} % rad, right ascension of the ascending node
        argp {mustBeInRange(argp,0,6.283185307179586)} % rad, argument of periapsis
        nu {mustBeInRange(nu,0,6.283185307179586)} % rad, true anomaly
    end % properties


end % class COE
