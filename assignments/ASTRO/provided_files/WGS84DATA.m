classdef WGS84DATA
% WGS84DATA
% wgs84 = WGS84DATA()
% A variable of class WGS84DATA contains constant WGS84 values 
%   .MU .RE .OmegaEarth .Flat
% as well as derived values additional useful values

% Author
%  Originally written by Capt Dave Vallado
%  Modified and Extended for Ada by Dr Ron Lisowski
%  Extended from DFASMath.adb by Thomas L. Yoder, LtCol, Spring 00
%  Made WGS84 and derived values consistent by Scott R. Dahlke, Spring 08
%  Modified by LtCol Luke Sauter into a structured array 2017
%  Added Documentation Scott Dahlke, 2023-06-20
%  turned into a matlab class, Lt Col Jordan Firth, 2024-10
%
% Inputs
%   None
%
% References
%   https://earth-info.nga.mil/index.php?dir=wgs84&action=wgs84
%
%==========================================================================
   
% define class properties
% NOTE: can't do math in property definitions
% properties that require math are defined in constructor method below
properties (SetAccess = immutable)
            % *** indicates the four acutal WGS84 values 
Deg 		% radians to degrees factor deg/rad
Rad 		% degrees to radians factor rad/deg
MU   		% *** gravitational parameter of Earth km^3/sec^2
RE   		% *** radius of Earth km
OmegaEarth  % *** rotation rate of Earth rad/sec
SidePerSol 	% Sidereal Days/Solar Day
RadPerDay 	% rotation rate of Earth rad/day
SecDay   	% sec/day
Flat 		% *** flattening of the earth (unitless)
EEsqrd 		% eccentricity of Earth's ellipsoid squared (unitless)
EEarth 		% eccentricity of Earth's ellipsoid (unitless)
J2   		% J2 geopotential of Earth (oblateness) (unitless)
J3   		% J3 geopotential of Earth (unitless)
J4   		% J4 geopotential of Earth (unitless) 
GMM   		% gravitational parameter of the Moon km^3/sec^2
GMS   		% gravitational parameter of the Sun km^3/sec^2
AU   		% distance from Sun to Earth km
HalfPI 		% pi/2 unitless
TwoPI 		% 2*pi unitless
Zero_IE   	% Small number for incl & ecc purposes
Small   	% Small number used for tolerance purposes
end % properties

methods 
    function obj = WGS84DATA
	
obj.Deg        = 180.0/pi;                  % radians to degrees factor deg/rad
obj.Rad        = pi/180.0;                  % degrees to radians factor rad/deg
obj.HalfPI     = pi/2.0;                    % pi/2 unitless
obj.TwoPI      = 2.0*pi;                    % 2*pi unitless
obj.MU         = 398600.5;                  % *** gravitational parameter of Earth km^3/sec^2
obj.SecDay     = 86400.0;                   % sec/day
obj.RE         = 6378.137;                  % *** radius of Earth km
obj.OmegaEarth = 0.00007292115;             % *** rotation rate of Earth rad/sec
obj.RadPerDay  = obj.OmegaEarth*obj.SecDay; % rotation rate of Earth rad/day
obj.SidePerSol = obj.RadPerDay/obj.TwoPI; 	% Sidereal Days/Solar Day
obj.Flat       = 1.0/298.257223563;         % *** flattening of the earth (unitless)
obj.EEsqrd     = (2.0-obj.Flat)*obj.Flat;   % eccentricity of Earth's ellipsoid squared (unitless)
obj.EEarth     = sqrt(obj.EEsqrd); 			% eccentricity of Earth's ellipsoid (unitless)
obj.J2         = 0.00108263;                % J2 geopotential of Earth (oblateness) (unitless)
obj.J3         = -0.00000254;               % J3 geopotential of Earth (unitless)
obj.J4         = -0.00000161;               % J4 geopotential of Earth (unitless) 
obj.GMM        = 4902.774191985;            % gravitational parameter of the Moon km^3/sec^2
obj.GMS        = 1.32712438E11;             % gravitational parameter of the Sun  km^3/sec^2
obj.AU         = 149597870.0;               % distance from Sun to Earth km
obj.Zero_IE    = 0.015;                     % Small number for incl & ecc purposes
obj.Small      = 1.0E-6;                    % Small number used for tolerance purposes

end % constructor function

end % methods

end % class WGS84DATA
