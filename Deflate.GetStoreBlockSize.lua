return function (self,block_start,block_end,total_bitlen) 
assert(block_end - block_start + 1 <= 65535)
local block_bitlen = 3
total_bitlen = total_bitlen + 3
local padding_bitlen = (8 - total_bitlen % 8) % 8
block_bitlen = block_bitlen + padding_bitlen
block_bitlen = block_bitlen + 32
block_bitlen = block_bitlen + (block_end - block_start + 1) * 8
return block_bitlen
end