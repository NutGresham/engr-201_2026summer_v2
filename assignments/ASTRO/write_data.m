function [] = write_data(fid_out, case_num, tof, RV_i)
% write
% [] = write(fid_out, case_num, RV_i)
% writes data from R, V, and tof to output file with handle fid_out

if nargin == 1
    % called with no value inputs, print file header and exit function
    fprintf(fid_out, 'units: km s deg, datetime, R1, R2, R3, V1, V2, V3, a, e, i, Ω, ω, ν, tof');
    
	% exit function--there's no data to print
    return 
end % if nargin == 1

%%%%%%% input validation
if ~isa(RV_i, 'SATELLITE_RV') % || ~isa(RV_f, 'SATELLITE_RV')
    error('RV inputs must each be a variable of class SATELLITE_RV')
end

% if ~isa(COE_i, 'SATELLITE_COE') % || ~isa(COE_f, 'SATELLITE_COE')
%     error('COE inputs must each be a variable of class SATELLITE_COE')
% end
%%%%%%% end 
    
    %%%%%%%%% case number
    fprintf(fid_out, '\n ,,,,,,,,,,,,,, ', case_num, RV_i.name);
    fprintf(fid_out, '\n*** CASE %i %s *** ,,,,,,,,,,,,,,', case_num, RV_i.name);
    
    %%%%%%%%% input line
    fprintf(fid_out, '\ninput, ');
    RV_i.datetime.Format='uuuu-MM-dd''T''HH:mm:ssX'; 

    fprintf(fid_out, '%s, ', RV_i.datetime);
    fprintf(fid_out, '%.3f, %.3f, %.3f, ', RV_i.R(1), RV_i.R(2), RV_i.R(3)); % position vector
    fprintf(fid_out, 'Vi, Vj, Vk, '); % placeholder
    fprintf(fid_out, 'a, e, i, '); % placeholder
    fprintf(fid_out, 'Ω, ω, ν, '); % placeholder
    fprintf(fid_out, '%.0f\n', tof) ; % time of flight
    
    % %%%%%%%%% output line
    % fprintf(fid_out, '\noutput, ');
    % RV_f.datetime.Format='uuuu-MM-dd''T''HH:mm:ssX'; 
    

    

end % function write