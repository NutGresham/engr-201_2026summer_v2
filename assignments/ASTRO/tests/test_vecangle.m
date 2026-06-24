clearvars; clc; format compact
addpath('../provided_files')

%% testing angles

disp('same angle--output should be zero')
a = [1 0 0]';
b = a;
output = vecangle(a, b)

disp('normal vectors--output should be pi/2')
a = [1 0 0]';
b = [0 1 0]';
output = vecangle(a,b)

disp('opposite vectors--output should be pi')
a = [1 0 0]';
b = -a;
output = vecangle(a,b)


%% checking function error messages

% for illustration only
% this section is more elaborate than you need
% -- you do not need to check your error messages

% this try/catch block is used to turn error messages (which stop code)
% into warnings (which do not stop code)

disp('should fail--these vectors are not the same size')
a = [1 2 3]';
b = [1 2]';
try
    vecangle(a,b)
catch e
    warning(e.message)
end

disp('should fail--these are matrices, not vectors')
a = eye(2);
b = eye(2);
try
    vecangle(a,b)
catch e
    warning(e.message)
end

disp('should fail--these are scalars')
a = 1;
b = 1;
try
    vecangle(a,b)
catch e
    warning(e.message)
end


