# orbit_propagation

Calculate future satellite position



## author

Lt Col Jordan Firth

jordan.firth@afacademy.af.edu

USAFA/DFAS

2024-10



## inputs

Script does not have any function inputs. 

Script reads input values from file defined in variable `infile` (currently `RV2.dat`). 



## outputs

Script does not have any function inputs. 

Script writes output values to file defined in variable `outfile` (currently `output2.csv`). 



## formats

`infile` identifies a text input file. Each line contains satellite state: 3 components of a position vector, 3 components of a velocity vector, and a time of flight. Numbers are floating point numbers separated by a space. 

```
R1 R2 R3 V1 V2 V3 tof
```



`outfile` identifies a `.csv` (comma-separated value) output filename. `orbit_propagation` will print to the output file: 

- initial R, V (input)
- initial COEs
- final (propagated) COEs
- final (propagated) R, V

The header identifies units and contains column labels. Each line in `infile` produces 4 additional lines in `outfile`. See [`../readme.md`](../ASSIGNMENT_INSTRUCTIONS.md#output) for details. 



## constants

none



## coupling

Calls `WGS84DATA()` for Earth parameters. 



## references

none



## process

Find Earth’s gravitational parameter

- wgs84 = WGS84DATA()

- μ = wgs84.MU



Create `outfile` (overwrite any existing contents) 

- `fid_out = fopen(outfile, ‘wt’);`

write header line, close file

- `write_data(fid_out);`
- `fclose(fid_out);`



Open `infile` for reading

- `fid_in = fopen(infile, ‘rt’)`



Create empty RV variable

- `RV_initial = SATELLITE_COE();`



Read one line of `infile` 

- `[RV_initial, tof] = ingest(fid_in);`



==turn initial RV into initial COE==



==turn initial COE into future COE==



==turn future COE into future RV==



open`outfile` for appending, write relevant data, close `outfile`

- `fid_out = fopen(outfile, ‘at’);`
- `write_data(fid_out, 1, tof, RV_initial);`
- `fclose(fid_out);`



Close infile

- `fclose(fid_in);`



End of function`orbit_propagation`
