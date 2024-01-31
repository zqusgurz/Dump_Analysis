return function (self,queue) 
local first = queue.first
if first > queue.last then return nil end
local value = queue[first]
queue[first] = nil        -- to allow garbage collection
queue.first = first + 1
return value
end