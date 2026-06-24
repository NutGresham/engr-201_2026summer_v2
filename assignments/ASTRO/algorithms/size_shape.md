# [a, ecc] = size_shape(RV, E, mu)





## inputs

position and velocity vector for a single satellite state

|      | description                                     | units      | value/range                                                  |
| ---- | ----------------------------------------------- | ---------- | ------------------------------------------------------------ |
| RV   | satellite state containing R and V vectors      |            | see [`../provided_files/SATELLITE_RV.m`](../provided_files/SATELLITE_RV.m) |
| E    | 3-element eccentricity vector—points to perigee | N/A        | real                                                         |
| mu   | central body gravitational parameter            | km^3^/s^2^ | 398600.5 (for Earth)                                         |

## outputs

|     | description     | units | value/range |
| --- | --------------- | ----- | ----------- |
| a   | semi-major axis | km    | positive    |
| ecc | eccentricity    | N/A   | 0 ≤ ecc < 1 |

