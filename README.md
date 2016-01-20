# CoronaGeometry
Lib for manipulating rectangles in Corona SDK, just like CGRect... functions in Objective-C and Swift.

## Usage
```
local G = require "geometry"

-- You can pass any 2 of keys minX, maxX, width and any 2 of keys minY, maxY, height. 
local rect = G.Rect:new {
	minX = 10,
	maxY = 200,
	maxX = 20,
	height = 400
}
print(rect) -- RECT (10, -200) - (20, 200)
print(rect:width(), rect:height()) -- 10	400

-- You can check rects for equality
local other = G.Rect:new {
	minX = 10,
	width = 10,
	maxY = 200,
	height = 400
}
print(rect == other) -- true

-- You can obtain rect from any displayObject
local c = display.newCircle(300, 400, 50) 
print(G.Rect:fromObject(c)) -- RECT (250, 350) - (350, 450)

-- offsetBy() translates rect, insetBy() - resizes
-- G.Rect:zero() - zero rect with every param is 0
print(G.Rect:zero():offsetBy(30, 40):insetBy(-20, -20)) -- RECT (10, 20) - (50, 60)
```
