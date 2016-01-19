local Rect = {}

local rectMT = {}

-- function rectMT:apply(object)

-- end
-------------- rectMT
function rectMT:width()
	return self.maxX - self.minX
end

function rectMT:height()
	return self.maxY - self.minY
end

function rectMT:centerX()
	return (self.minX + self.maxX) * 0.5
end

function rectMT:centerY()
	return (self.minY + self.maxY) * 0.5
end

function rectMT:offsetBy(dx, dy) 
	return Rect:new {
		minX = self.minX + dx,
		minY = self.minY + dy,
		width = self:width(),
		height = self:height()
	}
end

function rectMT:insetBy(dx, dy)
	if dx > self:width() * 0.5 then
		dx = self:width() * 0.5
	end
	if dy > self:height() * 0.5 then
		dy = self:height() * 0.5
	end
	return Rect:new {
		minX = self.minX + dx,
		maxX = self.maxX - dx,
		minY = self.minY + dy,
		maxY = self.maxY - dy
	}
end

-------- metamethods
rectMT.__index = rectMT

function rectMT:__tostring()
	return "RECT (" .. self.minX .. ", " .. self.minY 
		.. ") - (" .. self.maxX .. ", " .. self.maxY .. ")"
end

function rectMT:__eq(other)
	return self.minX == other.minX and self.maxX == other.maxX 
		and self.minY == other.minY and self.maxY == other.maxY
end


-------------- Rect

function Rect:new(params)
	local width, height
	local xKeys = { "minX", "maxX", "width" }
	local yKeys = { "minY", "maxY", "height" }
	local rect = {}
	rect.minX = params.minX or params.maxX - params.width
	rect.maxX = params.maxX or params.minX + params.width
	rect.minY = params.minY or params.maxY - params.height
	rect.maxY = params.maxY or params.minY + params.height
	assert(rect.minX <= rect.maxX, "minX must be <= than maxX")
	assert(rect.minY <= rect.maxY, "minY must be <= than maxY")
	setmetatable(rect, rectMT)
	return rect
end

function Rect:fromObject(obj) 
	local cb = obj.contentBounds
	return Rect:new {
		minX = cb.xMin,
		maxX = cb.xMax,
		minY = cb.yMin,
		maxY = cb.yMax
	}
end

function Rect:zero()
	return self:new { minX = 0, maxX = 0, minY = 0, maxY = 0 }
end

-- function Rect:null()

-- end

-- function Rect:inf()

-- end

return Rect