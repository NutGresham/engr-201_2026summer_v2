% insert header documentation here

clc; clearvars; 
addpath('provided_files')

infile = 'RV.dat'; 
outfile = 'output.csv'; 

wgs84 = WGS84DATA(); 
mu = wgs84.MU; 

fid_out = fopen(outfile, 'wt'); % open new file for writing (text)
write_data(fid_out);  
fclose(fid_out);

fid_in = fopen(infile,'rt'); % open file for reading (text)

case_num = 1; 

while ~feof(fid_in)
    [RV_i, tof] = ingest(fid_in); 
    
    % initial RV to initial COE
    % COE_i = rv_to_coe(RV_i, mu);
    
    % initial COE to final COE
    % COE_f = coeupdate(COE_i, mu, tof); 
    
    % final COE to final RV
    % RV_f = coe_to_rv(COE_f, mu); 
    
    % write data to file
    fid_out = fopen(outfile, 'at'); % open file for appending (text)
    write_data(fid_out, case_num, tof, RV_i)
    fclose(fid_out);
    
end
% close input file
fclose(fid_in); 





