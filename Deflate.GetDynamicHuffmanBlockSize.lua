return function (self,lcodes,dcodes,HCLEN,rle_codes_huffman_bitlens,rle_deflate_codes,lcodes_huffman_bitlens,dcodes_huffman_bitlens) 
local block_bitlen = 17   block_bitlen = block_bitlen + (HCLEN + 4) * 3

for i = 1, #rle_deflate_codes do
  local code = rle_deflate_codes[i]
  block_bitlen = block_bitlen + rle_codes_huffman_bitlens[code]
  if code >= 16 then
    block_bitlen = block_bitlen +
                      ((code == 16) and 2 or (code == 17 and 3 or 7))
  end
end

local length_code_count = 0
for i = 1, #lcodes do
  local code = lcodes[i]
  local huffman_bitlen = lcodes_huffman_bitlens[code]
  block_bitlen = block_bitlen + huffman_bitlen
  if code > 256 then       length_code_count = length_code_count + 1
    if code > 264 and code < 285 then         local extra_bits_bitlen = self._literal_deflate_code_to_extra_bitlen[code -
                                  256]
      block_bitlen = block_bitlen + extra_bits_bitlen
    end
    local dist_code = dcodes[length_code_count]
    local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_code]
    block_bitlen = block_bitlen + dist_huffman_bitlen

    if dist_code > 3 then         local dist_extra_bits_bitlen = (dist_code - dist_code % 2) / 2 - 1
      block_bitlen = block_bitlen + dist_extra_bits_bitlen
    end
  end
end
return block_bitlen
end