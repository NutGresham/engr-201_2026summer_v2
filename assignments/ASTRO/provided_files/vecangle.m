function angle = vecangle(v1, v2)
% vecAngle
% angle = vecAngle(v1, v2)
% computes the angle between two vectors v1 and v2 using the dot product

%   Input:
%       v1 - First vector (as a row or column vector)
%       v2 - Second vector (as a row or column vector)
%
%   Output:
%       angle - The angle between v1 and v2 in degrees

    % Ensure the vectors are same-size 1D vectors
    size_v1 = size(v1); size_v2 = size(v2); 
    if ~isequal(size_v1,size_v2)
        error('input vectors must be the same size');
    elseif min(size_v1) > 1
        error('inputs are matrices, not vectors')
    elseif max(size_v1) < 2
        error('inputs are scalars')
    end % if not same-size 1D vectors
    
    % Compute the cosine of the angle
    cos_theta = dot(v1, v2) / norm(v1) / norm(v2);
    
    % Ensure cosine value in valid range [-1, 1] to avoid numerical issues
    cos_theta = max(min(cos_theta, 1), -1);
    
    % Compute the angle in radians
    angle = acos(cos_theta);
    
end % function vecangle