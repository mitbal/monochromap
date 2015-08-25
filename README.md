# Static Map

A small, python-based library for creating map images with lines and markers.

## Example
```python
m = StaticMap(300, 400, 10)
m.add_line(Line(((13.4, 52.5), (2.3, 48.9)), 'blue', 3))
image = m.render()
image.save('map.png')
```
This will create a 300px x 400px map with a blue line drawn from Berlin to Paris.
![Map with Line from Berlin to Paris](/samples/berlin_paris.png?raw=true)


## Installation
StaticMap is a small library, all it takes is python3 and two python packages: [Pillow](https://python-pillow.github.io/) and [request](http://www.python-requests.org/). You can install them via:

```bash
pip install -r requirements.txt
```

## Usage
### Create a new map instance:

```python
m = StaticMap(width, height, padding, url_template, tile_size)
```

parameter     | description
------------- | -------------
width         | width of the image in pixels
height        | height of the image in pixels
padding       | (optional) minimum distance in pixel between map features (lines, markers) and map border
url_template  | (optional) the tile server URL for the map base layer, e.g. <code>http://a.tile.osm.org/{z}/{x}/{y}.png</code>the stroke width of the line in pixel 
tile_size     | (optional) tile size in pixel, usually 256

### Add a line:

```python
line = Line(coordinates, color, width))
m.add_line(line)
```

parameter     | description
------------- | -------------
coordinate    | a sequence of lon/lat pairs
color         | a color definition Pillow <a href="http://pillow.readthedocs.org/en/latest/reference/ImageColor.html#color-names">supports</a>
width         | the stroke width of the line in pixel

### Add a map marker:

```python
marker = Marker(coordinate, color, width))
m.add_marker(marker)
```

parameter     | description
------------- | -------------
coordinate    | a lon/lat pair: e.g. `(120.1, 47.3)`
color         | a color definition Pillow <a href="http://pillow.readthedocs.org/en/latest/reference/ImageColor.html#color-names">supports</a>
width         | diameter of marker in pixel


## Samples
### Show Position on Map
```python
m = StaticMap(200, 200, url_template='http://a.tile.osm.org/{z}/{x}/{y}.png')

marker_outline = Marker((10, 47), 'white', 18)
marker = Marker((10, 47), '#0036FF', 12)

m.add_marker(marker_outline)
m.add_marker(marker)

image = m.render(zoom=5)
image.save('marker.png')
```

![Position Marker on a Map](/samples/marker.png?raw=true)

### Show Ferry Connection
```python
m = StaticMap(200, 200, 80)

coordinates = [[12.422, 45.427], [13.749, 44.885]]
line_outline = Line(coordinates, 'white', 6)
line = Line(coordinates, '#D2322D', 4)

m.add_line(line_outline)
m.add_line(line)

image = m.render()
image.save('ferry.png')
```

![Ferry Connection Shown on a Map](/samples/ferry.png?raw=true)

### Licence
StaticMap is open source and licensed under Apache License, Version 2.0

The map samples on this page are made with [OSM](http://www.osm.org) data, © [OpenStreetMap](http://www.openstreetmap.org/copyright) contributors