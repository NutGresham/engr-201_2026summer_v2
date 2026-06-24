
wgs84 = WGS84DATA(); 
mu = wgs84.MU; 

infile = 'RV1.dat'; 
fid_in = fopen(infile,'rt'); 
[RV_i, tof] = ingest(fid_in); 

[H, N, E] = hnevec(RV_i, mu)