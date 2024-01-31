return function (self,queue,val) 
local last = queue.last + 1
queue.last = last
queue[last] = val
end