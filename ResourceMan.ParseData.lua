return function (self,_ds,imgPath) 
---@type MODUserDataSet
local ds = _ds
local root = WzObject()
root.Type = _WzVariantType.Property
root.Name = imgPath

-- Test
local hit = 0
local pathCaches = {}

function parse(name, typeKey, value)
	local ret = {}
	ret.Children = {}
	local type = _WzVariantType:ParseType(typeKey)
	ret.Type = type
	if (type == 1) then -- _WzVariantType.I16
		ret.Number = tonumber(value)
	elseif (type == 2) then -- _WzVariantType.I32
		ret.Number = tonumber(value)
	elseif (type == 3) then -- _WzVariantType.I64
		ret.Number = tonumber(value)
	elseif (type == 4) then -- _WzVariantType.Float
		ret.Number = tonumber(value)
	elseif (type == 5) then -- _WzVariantType.Double
		ret.Number = tonumber(value)
	elseif (type == 6) then -- _WzVariantType.String
	    ret.String = value
	elseif (type == 7) then -- _WzVariantType.Vector2D
		local si,_ = value:find(",",1,true)
		ret.Vector = Vector2(tonumber(value:sub(1, si-1)), tonumber(value:sub(si+1)))
	elseif (type == 8) then -- _WzVariantType.Canvas
		local si,_ = value:find(",",1,true)
		local si2,_ = value:find(",",si+1,true)
	    ret.String = value:sub(1, si-1)
		ret.Vector = Vector2(tonumber(value:sub(si+1, si2-1)), tonumber(value:sub(si2+1)))
	elseif (type == 0) then -- _WzVariantType.Property
		-- Nothing
	elseif (type == 9) then -- _WzVariantType.Sound
	    ret.String = value
	elseif (type == 10) then -- _WzVariantType.UOL
	    ret.String = value
	end
	ret.Name = name
	return ret
end

for i=1,ds:GetRowCount() do
--for _,row in ipairs(ds:GetAllRow()) do

	local t = root
    local key = ds:GetCell(i, 1)
    local ty = ds:GetCell(i, 2)
    local value = ds:GetCell(i, 3)
    --local key = row:GetItem("Path")
    --local ty = row:GetItem("Type")
    --local value = row:GetItem("Value")
	if (_UtilLogic:IsNilorEmptyString(key)) then
		continue
	end
		
    local start = 1
    while true do
        local ps,_ = key:find("/",start,true)
        if (ps == nil) then
            local pathElement = key:sub(start)
            t.Children[pathElement] = parse(pathElement, ty, value)
            t.Children[pathElement].Parent = t
            hit += 1
            break
        else
            local pathElement = key:sub(start,ps-1)
            if (t.Children[pathElement] == nil) then
                t.Children[pathElement] = parse(pathElement, nil, "Property")
                t.Children[pathElement].Parent = t
            end
            hit += 1
            t = t.Children[pathElement]
            start = ps+1
        end
    end
end
	
if (imgPath == "_") then
	--log ("Load Skill Hit", hit)		
end

return root
end