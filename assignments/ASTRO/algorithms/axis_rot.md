# [out_vector] = axis_rot(in_vector, axis, angle)

axisrot

out = axisrot(axis, angle, vector)

performs a coordinate rotation



## author

Lt Col Jordan Firth

USAFA/DFAS

2025-09



## inputs

|           | ASCII     | description       | units | value/range        |
| --------- | --------- | ----------------- | ----- | ------------------ |
| $\vec{a}$ | in_vector | 3x1 vector        |       | real               |
|           | axis      | axis of rotation  |       | integer 1, 2, or 3 |
| θ         | angle     | angle of rotation | rad   | real               |



## outputs

|           | ASCII      | description | value/range |
| --------- | ---------- | ----------- | ----------- |
| $\vec{b}$ | out_vector | 3x1 vector  | real        |



## constants

none



## coupling

none



## references

none



## process

check input size—must be 3x1 (column) vector



determine which orientation matrix to use

switch axis

​	case 1
$$
[orient] = \begin{bmatrix} 
1& 0& 0\\
0& \cos\theta & \sin\theta\\
0& -\sin\theta & \cos\theta
\end{bmatrix}
$$

​	case 2 
$$
[orient] = \begin{bmatrix} 
\cos\theta & 0 & -\sin\theta\\
0 & 1 & 0 \\
\sin\theta & 0 & \cos\theta
\end{bmatrix}
$$

​	case 3 
$$
[orient] = \begin{bmatrix} 
\cos\theta & \sin\theta & 0\\
-\sin\theta &\cos\theta & 0\\
0 & 0 & 1
\end{bmatrix}
$$

end switch



pre-multiply input vector by orientation matrix
$$
\vec{b} = [orient] \vec{a}
$$
