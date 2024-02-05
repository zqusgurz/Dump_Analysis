return function (self,WriteBits,is_last_block,lcodes,lextra_bits,dcodes,dextra_bits) 
WriteBits(is_last_block and 1 or 0, 1)
WriteBits(1, 2)
local length_code_count = 0
local length_code_with_extra_count = 0
local dist_code_with_extra_count = 0
for i = 1, #lcodes do
  local deflate_code = lcodes[i]
  local huffman_code = self._fix_block_literal_huffman_code[deflate_code]
  local huffman_bitlen = self._fix_block_literal_huffman_bitlen[deflate_code]
  WriteBits(huffman_code, huffman_bitlen)
  if deflate_code > 256 then       length_code_count = length_code_count + 1
    if deflate_code > 264 and deflate_code < 285 then
      length_code_with_extra_count = length_code_with_extra_count + 1
      local extra_bits = lextra_bits[length_code_with_extra_count]
      local extra_bits_bitlen = self._literal_deflate_code_to_extra_bitlen[deflate_code - 256]
      WriteBits(extra_bits, extra_bits_bitlen)
    end
    local dist_code = dcodes[length_code_count]
    local dist_huffman_code = self._fix_block_dist_huffman_code[dist_code]
    WriteBits(dist_huffman_code, 5)

    if dist_code > 3 then
	  dist_code_with_extra_count = dist_code_with_extra_count + 1
      local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
      local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1
      WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
    end
  end
end
end