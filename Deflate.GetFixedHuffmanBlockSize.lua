return function (self,lcodes,dcodes) 
local block_bitlen = 3
local length_code_count = 0
for i = 1, #lcodes do
  local code = lcodes[i]
  local huffman_bitlen = self._fix_block_literal_huffman_bitlen[code]
  block_bitlen = block_bitlen + huffman_bitlen
  if code > 256 then
    length_code_count = length_code_count + 1
    if code > 264 and code < 285 then
	  local extra_bits_bitlen = self._literal_deflate_code_to_extra_bitlen[code - 256]
      block_bitlen = block_bitlen + extra_bits_bitlen
    end
    local dist_code = dcodes[length_code_count]
    block_bitlen = block_bitlen + 5

    if dist_code > 3 then
	  local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1
      block_bitlen = block_bitlen + dist_extra_bits_bitlen
    end
  end
end
return block_bitlen
end