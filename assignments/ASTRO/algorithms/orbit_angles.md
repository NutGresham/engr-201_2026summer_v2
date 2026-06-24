# [inc, RAAN, argp, nu] = angles(RV, H, N, E)



## inputs

position and velocity vector for a single satellite state

|      | description                                     | units   | value/range                                                  |
| ---- | ----------------------------------------------- | ------- | ------------------------------------------------------------ |
| RV   | satellite state containing R and V vectors      |         | see [`../provided_files/SATELLITE_RV.m`](../provided_files/SATELLITE_RV.m) |
| H    | 3-element specific angular momentum vector      | km^2^/s | real                                                         |
| N    | 3-element ascending node vector                 | N/A     | real, N~k~ = 0                                               |
| E    | 3-element eccentricity vector—points to perigee | N/A     | real                                                         |



## outputs

|      | description         | units | value/range  |
| ---- | ------------------- | ----- | ------------ |
| inc  | inclination         | rad   | 0 ≤ inc < π  |
| RAAN | RAAN                | rad   | 0 ≤ inc < 2π |
| argp | argument of perigee | rad   | 0 ≤ inc < 2π |
| nu   | true anomaly        | rad   | 0 ≤ inc < 2π |

