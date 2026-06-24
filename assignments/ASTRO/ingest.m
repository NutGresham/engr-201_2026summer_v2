function [RV, tof] = ingest(fid_in)
% ingest
% [RV, tof] = ingest(fid_in)
% reads R, V, and tof from Astro 201 input file

RV = SATELLITE_RV();

% try
    [RV.name, num(1)] = fscanf(fid_in, '%s', 1); 
    [date, num(2)] = fscanf(fid_in, '%c', 21) ; 
% catch
    % warning('unexpected data--extra space at end of file?')
    % return
% end

    date = date(2:end); 
    RV.datetime =  datetime(date, ...
        'InputFormat', 'uuuu-MM-dd HH:mm:ssX', 'TimeZone','UTC');
    
[R, num(3)] = fscanf(fid_in, '%f', 3);
[V, num(4)] = fscanf(fid_in, '%f', 3);
[t, num(5)] = fscanf(fid_in, '%f', 1);

if sum(num) < 29
    warning('unexpected input--extra space at end of line/file?')
end % if

RV.R = R; 
RV.V = V; 
tof = t; 

end % function ingest