return function (self,WriteBits,WriteString,is_last_block,str,block_start,block_end,total_bitlen) 
assert(block_end - block_start + 1 <= 65535)
WriteBits(is_last_block and 1 or 0, 1)   WriteBits(0, 2)   total_bitlen = total_bitlen + 3
local padding_bitlen = (8 - total_bitlen % 8) % 8
if padding_bitlen > 0 then
  WriteBits(self._pow2[padding_bitlen] - 1, padding_bitlen)
end
local size = block_end - block_start + 1
WriteBits(size, 16)

  local comp = (255 - size % 256) + (255 - (size - size % 256) / 256) * 256
WriteBits(comp, 16)

WriteString(str:sub(block_start, block_end))
end