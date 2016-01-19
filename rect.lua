local Rect = {}

local rectMT = {}

-- function rectMT:apply(object)

-- end
-------------- rectMT

function rectMT:offsetBy(dx, dy) 

end

function rectMT:insetBy(dx, dy)

end

-------- metamethods
function rectMT.__tostring(rect)
	return "RECT (" .. rect.minX .. ", " .. rect.minY 
		.. ") - (" .. rect.maxX .. ", " .. rect.maxY .. ")"
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

function Rect:zero()

end

function Rect:null()

end

function Rect:inf()

end

return Rect