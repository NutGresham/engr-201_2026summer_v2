# [H, N, E] = hne_vec(RV, mu)

 

## inputs

position and velocity vector for a single satellite state

|      | description                                | units      | value/range                                                  |
| ---- | ------------------------------------------ | ---------- | ------------------------------------------------------------ |
| RV   | satellite state containing R and V vectors | km, km/s   | see [`../provided_files/SATELLITE_RV.m`](../provided_files/SATELLITE_RV.m) |
| mu   | central body gravitational parameter       | km^3^/s^2^ | 398600.5 (for Earth)                                         |

## outputs

|      | description                           | units   | value/range   |
| ---- | ------------------------------------- | ------- | ------------- |
| H    | specific angular momentum vector      | km^2^/s | real          |
| N    | ascending node vector                 | N/A     | real, N_k = 0 |
| E    | eccentricity vector—points to perigee | N/A     | real          |



