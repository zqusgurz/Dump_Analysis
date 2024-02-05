return function (self,state) 
local ReadBits = state.ReadBits

local is_last_block
while not is_last_block do
  is_last_block = (ReadBits(1) == 1)
  local block_type = ReadBits(2)
  local status
  if block_type == 0 then
    status = self:DecompressStoreBlock(state)
  elseif block_type == 1 then
    status = self:DecompressFixBlock(state)
  elseif block_type == 2 then
    status = self:DecompressDynamicBlock(state)
  else
    return nil, -1     end
  if status ~= 0 then return nil, status end
end

state.result_buffer[#state.result_buffer + 1] =
  table.concat(state.buffer, "", 1, state.buffer_size)
local result = table.concat(state.result_buffer)
return result
end