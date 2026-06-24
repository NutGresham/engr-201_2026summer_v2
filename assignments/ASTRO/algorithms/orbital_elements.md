# [coe] = orbital_elements(RV, μ) 

Calculate orbital elements from position and velocity vectors. 



## author

Lt Col Jordan Firth

jordan.firth@afacademy.af.edu

USAFA/DFAS

2024-10



## inputs

position and velocity vector for a single satellite state

|      | description                          | units      | value/range                                                  |
| ---- | ------------------------------------ | ---------- | ------------------------------------------------------------ |
| RV   | variable of class `SATELLITE_RV`     | km, km/s   | see [`../provided_files/SATELLITE_COE.m`](../provided_files/SATELLITE_COE.m) |
| mu   | central body gravitational parameter | km^3^/s^2^ | 398600.5 (for Earth)                                         |



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

hne_vec.m: calculate orbit’s H, N, E vectors

size_shape.m: calculate orbit’s a, ecc

angles.m: calculate orbit’s angles (inc, RAAN, argp, nu)



## references

none



## process

create empty variable of class SATELLITE_COE

`coe = SATELLITE_COE()`



copy name and datetime of satellite observation from RV

`coe.name = RV.name`

`coe.datetime = RV.datetime`



Find H, N, E vectors

`[H, N, E] = hnevec(RV, mu)`



find size and shape of orbit

`[coe.a, coe.ecc] = size_shape(RV, E, mu)`



find orbit angles

`[coe.inc, coe.RAAN, coe.argp, coe.nu] = orbit_angles(RV, H, N, E)`



end of function `orbital_elements()`
