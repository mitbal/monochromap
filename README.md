# MonochroMap

A compact library to paint and plot black and white map. Inspired and continued from [StaticMap](https://github.com/komoot/staticmap).

Some of the modifications are:
- changed default tile to stamen toner
- streamlined graphical component addition with only same function
- supported graphical component alpha/transparency blending
- fixed many iconmarker IO error in one image

## Example
### Draw Lines
This example code will show the location of Laugh Tale from intersection of coordinates given by 4 road poneglyphs.

```python
from monochromap import MonochroMap, Line

m = MonochroMap()
line = Line(((13.4, 52.5), (2.3, 48.9)), '#ff000088', 15)
m.add_feature(line)

line = Line(((4.9041, 52.3676), (7.27, 46.57)), '#0000ff88', 15)
m.add_feature(line)

m.render()
```
![Europe](https://raw.githubusercontent.com/mitbal/monochromap/master/samples/laugh_tale.png "apparently one piece location is at Belgium and Luxembourg border, don't tell Luffy")

### Draw Points
This example code will show the hotspot of California forest fire. Don't ask why there is fire in the ocean, it's global warming.
```python
from monochromap import MonochroMap, Point

m = MonochroMap()
for i in range(1000):

    lat = 36.7783 + rng.normal()
    lon = -119.4179 + rng.normal()

    p = Point((lon, lat), '#fb294344', 5)
    m.add_feature(p)

m.render()
```
![California](https://raw.githubusercontent.com/mitbal/monochromap/master/samples/california.png "california forest fire")

### Draw (any) Polygon
This example will show how to plot one instance of polygon, namely rectangle. Other shape of polygon is left as an exercise for the reader.
```python
from monochromap import MonochroMap, Polygon

m = MonochroMap()

lon0, lat0 = (-6.114878, 106.731217)
lon1, lat1 = (-6.311491, 106.951200)
points = [[lat0, lon0], [lat0, lon1], [lat1, lon1], [lat1, lon0]]
m.add_feature(Polygon(points, '#ff000022', 'black'))

lon0, lat0 = (-6.156652, 106.912689)
lon1, lat1 = (-6.319975, 107.027262)
points = [[lat0, lon0], [lat0, lon1], [lat1, lon1], [lat1, lon0]]
m.add_feature(Polygon(points, '#00ff0033', 'black'))

lon0, lat0 = (-6.225684, 106.637555)
lon1, lat1 = (-6.319054, 106.807583)
points = [[lat0, lon0], [lat0, lon1], [lat1, lon1], [lat1, lon0]]
m.add_feature(Polygon(points, '#0000ff44', 'black'))

m.render()
```
![Jakarta](https://raw.githubusercontent.com/mitbal/monochromap/master/samples/jakarta_polygon.png "Jakarta is a city in Indonesia")

### Draw Icon (random image)
You can also plot any random image into the map. Here we will show the total number of covid patient on the world most adept country at defeating pandemic, according to reputable source, Plague inc.

```python
from monochromap import MonochroMap, IconMarker

m = MonochroMap()
lat, lon = (75.939847, -42.161182)

for i in range(78):

    icon = IconMarker(np.array([lon, lat]) + np.random.uniform(-0.3, 6.7, 2), '../samples/covid.png', 0, 0)
    m.add_feature(icon)

icon = IconMarker(np.array([-17.456606, 63.992837]) + np.random.uniform(-0.1, 0.1, 2), '../samples/covid.png', 0, 0)
m.add_feature(icon)

m.render()
```
![Greenland](https://raw.githubusercontent.com/mitbal/monochromap/master/samples/greenland.png)
