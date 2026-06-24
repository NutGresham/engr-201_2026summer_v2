function out_vector = axisrot(in_vector, axis, angle)
% axisrot
% out = axisrot(axis, angle, vector)
% performs a coordinate rotation

% ## author
% Lt Col Jordan Firth
% USAFA/DFAS
% 2025-09
% 
% ## inputs
% |           | ASCII     | description       | units | value/range        |
% | --------- | --------- | ----------------- | ----- | ------------------ |
% | $\vec{a}$ | in_vector | 3x1 vector        |       | real               |
% |           | axis      | axis of rotation  |       | integer 1, 2, or 3 |
% | θ         | angle     | angle of rotation | rad   | real               |
% 
% ## outputs
% |           | ASCII      | description | value/range |
% | --------- | ---------- | ----------- | ----------- |
% | $\vec{b}$ | out_vector | 3x1 vector  | real        |
% 
% ## constants
% none
% 
% ## coupling
% none
% 
% ## references 
% none

% ## process
% check input size—must be 3x1 (column) vector
if ~isequal(size(in_vector), [3 1])
    error('input must be 3-element column vector');
end % input size check

% determine which orientation matrix to use
switch axis
    case 1
        orient = [  1       0           0       ; 
                    0   cos(angle)  sin(angle)  ; 
                    0   -sin(angle) cos(angle)   ];
    case 2 
        orient = [  cos(angle)  0   -sin(angle) ; 
                        0       1       0       ; 
                    sin(angle)  0   cos(angle)   ];
    case 3 
        orient = []; 

    otherwise
        error('axis must be 1, 2, or 3')

end % switch axis

% pre-multiply input vector by orientation matrix
out_vector = orient * in_vector; 