= Tran Quoc Viet
+ First question
  - p + q = 12i - 4j
  - p - q = -2i + 14j
+ Second question
  - FC: 7.5 + 6.7 + 2.3 = 83
  - YFC: 3.5 + 6.7 + 6.3 = 73
  - ZFC: 6.5 + 7.7 + 2.3 = 85
+ Third question
  - 7x + 2y = 24, 8x + 2y = 30
    - $mat(
    7, 2;
    8, 2
    ) mat(
    x;
    y
    ) = mat(
    24;
    30
    )$

    - $mat(
    x;
    y
    ) = mat(
    2, -8;
    -2, 7
    ) mat(
    24;
    30
    )$
    - $mat(
    x;
    y) = mat(
    -192;
    162)$
+ Fourth question
- Image of the resulting code in python:
#image("Figure_1.png")
- The code used to display (in python):
```python
from matplotlib.patches import Polygon
import matplotlib.pyplot as plt
import matplotlib
matplotlib.use('Qt5Agg') # or 'Qt5Agg', 'Qt4Agg', 'WXAgg', 'GTKAgg'
fig, ax = plt.subplots()
polygon1 = Polygon([(3,-1), (5,-3), (5,-5), (3,-7), (1,-5), (1,-3)], edgecolor='black', facecolor='green')
polygon2 = Polygon([(-3,-1), (-5,-3), (-5,-5), (-3,-7), (-1,-5), (-1,-3)], edgecolor='black', facecolor='blue')
xaxis = Polygon([(10,0), (-10,0), (10,0)], edgecolor='black', facecolor='black')
yaxis = Polygon([(0,10), (0,-10), (0,10)], edgecolor='black', facecolor='black')
ax.add_patch(polygon1)
ax.add_patch(polygon2)
ax.add_patch(yaxis)
ax.add_patch(xaxis)
ax.set_xlim(-10,10)
ax.set_ylim(-10,10)
ax.set_aspect('equal')
#plt.grid(True)
plt.title('Polygon')
plt.show()
```
// Local Variables:
// typst-preview--master-file: "/home/viet/notes/2026-03-10_MATH_HW.typ"
// End:
