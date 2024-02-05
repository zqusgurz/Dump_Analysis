return function (self,elements,probGetter) 
local totalProps = 0
local elementNum = #elements
for i=1,elementNum do
	totalProps += probGetter(elements[i])
end
if (totalProps > 0) then
	local rand = _GlobalRand32:RandomIntegerRange(1, totalProps)
	for i=1,elementNum do
		rand -= probGetter(elements[i])
		if (rand <= 0) then
			return elements[i]
		end
	end
end
return nil
end