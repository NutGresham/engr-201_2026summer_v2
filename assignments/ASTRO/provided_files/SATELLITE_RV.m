classdef SATELLITE_RV
% SATELLITE_RV
% A variable of class SATELLITE_RV is a single variable that represents
% a complete satellite ephemeris stored as a position vector R and a 
% velocity vector V. 
% It contains the following properties:
%   .name .datetime .R .V
% vector units are km, km/s

    properties
        name % satellite name (string)
        datetime % datetime of ephemeris
        R % km, position, 3x1 (column) vector
        V % km/s, velocity, 3x1 (column) vector
    end % properties

    methods
        function obj = set.R(obj, val)
            if size(val) == [3 1]
                obj.R = val; 
            else
                error("R must be 3x1 (column) vector")
            end
        end % function set R

        function obj = set.V(obj, val)
            if size(val) == [3 1]
                obj.V = val; 
            else
                error("V must be 3x1 (column) vector")
            end
        end % function set V

    end % methods

end % class RV
