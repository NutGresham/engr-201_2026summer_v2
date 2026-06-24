

# angle = vecangle(v1, v2) 

vecangle

function angle= vecangle(v1, v2) 

vecangle finds the angle between two vectors using the dot product



## author
Lt Col Jordan Firth
2024-10



## version

1.0



## inputs

|          | ASCII | description                        | units      | value/range                |
| -------- | ----- | ---------------------------------- | ---------- | -------------------------- |
| $\vec a$ | v1    | column vector                      | any units  | 3 $\times$ 1 column vector |
| $\vec b$ | v2    | column vector the same size as `a` | same units | 3 $\times$ 1 column vector |



## outputs

|          | ASCII | description                   | units | value/range    |
| -------- | ----- | ----------------------------- | ----- | -------------- |
| $\theta$ | angle | angle between 2 input vectors | rad   | 0 ≤ output ≤ π |



## constants

none



## coupling

none



## references

Astro 310 equation sheet



## process

find cos_theta

$$
cos\_theta =\frac{\vec a\cdot \vec b}{|a| |b|}
$$



ensure -1 ≤ cos θ ≤ 1—this should always happen mathematically, but sometimes rounding makes it not true

`if cos_theta < -1; cos_theta = -1; `

`if cos_theta > 1; cos_theta = 1; `



find output angle
$$
\theta=\cos^{-1}(cos\_theta )
$$