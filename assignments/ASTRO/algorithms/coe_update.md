# [new_coe] = coe_update(old_coe, tof, μ) 

propagate COE forward in time (time of flight). 



## inputs

| symbol | ASCII   | description                          | units      | value/range                                                  |
| ------ | ------- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
|        | old_coe | variable of class `SATELLITE`        |            | see [`../provided_files/SATELLITE_COE.m`](../provided_files/SATELLITE_COE.m) |
|        | tof     | time of flight                       | s          | real                                                         |
| μ      | mu      | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth)                                         |



## outputs

coe: One instance of class `SATELLITE_COE` with the following properties; see [`../provided_files/SATELLITE_COE.m`](../provided_files/SATELLITE_COE.m)

| symbol | ASCII | description         | units | value/range  |
| ------ | ----- | ------------------- | ----- | ------------ |
| a      | .a    | semi-major axis     | km    | positive     |
| e      | .ecc  | eccentricity        |       | 0 ≤ ecc < 1  |
| i      | .inc  | inclination         | rad   | 0 ≤ inc < π  |
| Ω      | .RAAN | RAAN                | rad   | 0 ≤ inc < 2π |
| ω      | .argp | argument of perigee | rad   | 0 ≤ inc < 2π |
| ν      | .nu   | true anomaly        | rad   | 0 ≤ inc < 2π |



## constants

none



## coupling

newton.m to solve kepler’s problem



## assumptions

2 body motion, fixed central body

- a, e, i, Ω, ω fixed



## process

because of assumptions, 5 elements do not change

- new_coe = old_coe



==fill in rest of process to get to future mean anomaly==



`Ef = newton(e, Mf)`



==fill in rest of process to get future true anomaly==

