return function (self,heap,heap_size) 
local top = heap[1]
local e = heap[heap_size]
local value = e[1]
heap[1] = e
heap[heap_size] = top
heap_size = heap_size - 1

local pos = 1
local left_child_pos = pos * 2
local right_child_pos = left_child_pos + 1

while (left_child_pos <= heap_size) do
  local left_child = heap[left_child_pos]
  if (right_child_pos <= heap_size and heap[right_child_pos][1] <
    left_child[1]) then
    local right_child = heap[right_child_pos]
    if right_child[1] < value then
      heap[right_child_pos] = e
      heap[pos] = right_child
      pos = right_child_pos
      left_child_pos = pos * 2
      right_child_pos = left_child_pos + 1
    else
      break
    end
  else
    if left_child[1] < value then
      heap[left_child_pos] = e
      heap[pos] = left_child
      pos = left_child_pos
      left_child_pos = pos * 2
      right_child_pos = left_child_pos + 1
    else
      break
    end
  end
end

return top
end