return function (self,heap,e,heap_size) 
heap_size = heap_size + 1
heap[heap_size] = e
local value = e[1]
local pos = heap_size
local parent_pos = (pos - pos % 2) / 2

while (parent_pos >= 1 and heap[parent_pos][1] > value) do
  local t = heap[parent_pos]
  heap[parent_pos] = e
  heap[pos] = t
  pos = parent_pos
  parent_pos = (parent_pos - parent_pos % 2) / 2
end
end