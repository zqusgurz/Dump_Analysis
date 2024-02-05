return function (self,WriteBits,is_last_block,lcodes,lextra_bits,dcodes,dextra_bits,HLIT,HDIST,HCLEN,rle_codes_huffman_bitlens,rle_codes_huffman_codes,rle_deflate_codes,rle_extra_bits,lcodes_huffman_bitlens,lcodes_huffman_codes,dcodes_huffman_bitlens,dcodes_huffman_codes) 
WriteBits(is_last_block and 1 or 0, 1)
WriteBits(2, 2) 
WriteBits(HLIT, 5)
WriteBits(HDIST, 5)
WriteBits(HCLEN, 4)

for i = 1, HCLEN + 4 do
  local symbol = self._rle_codes_huffman_bitlen_order[i]
  local length = rle_codes_huffman_bitlens[symbol] or 0
  WriteBits(length, 3)
end

local rleExtraBitsIndex = 1
for i = 1, #rle_deflate_codes do
  local code = rle_deflate_codes[i]
  WriteBits(rle_codes_huffman_codes[code], rle_codes_huffman_bitlens[code])
  if code >= 16 then
    local extraBits = rle_extra_bits[rleExtraBitsIndex]
    WriteBits(extraBits, (code == 16) and 2 or (code == 17 and 3 or 7))
    rleExtraBitsIndex = rleExtraBitsIndex + 1
  end
end

local length_code_count = 0
local length_code_with_extra_count = 0
local dist_code_with_extra_count = 0

for i = 1, #lcodes do
  local deflate_codee = lcodes[i]
  local huffman_code = lcodes_huffman_codes[deflate_codee]
  local huffman_bitlen = lcodes_huffman_bitlens[deflate_codee]
  WriteBits(huffman_code, huffman_bitlen)
  if deflate_codee > 256 then       length_code_count = length_code_count + 1
    if deflate_codee > 264 and deflate_codee < 285 then
              length_code_with_extra_count = length_code_with_extra_count + 1
      local extra_bits = lextra_bits[length_code_with_extra_count]
      local extra_bits_bitlen =
        self._literal_deflate_code_to_extra_bitlen[deflate_codee - 256]
      WriteBits(extra_bits, extra_bits_bitlen)
    end
          local dist_deflate_code = dcodes[length_code_count]
    local dist_huffman_code = dcodes_huffman_codes[dist_deflate_code]
    local dist_huffman_bitlen = dcodes_huffman_bitlens[dist_deflate_code]
    WriteBits(dist_huffman_code, dist_huffman_bitlen)

    if dist_deflate_code > 3 then         dist_code_with_extra_count = dist_code_with_extra_count + 1
      local dist_extra_bits = dextra_bits[dist_code_with_extra_count]
      local dist_extra_bits_bitlen = (dist_deflate_code - dist_deflate_code %
                                        2) / 2 - 1
      WriteBits(dist_extra_bits, dist_extra_bits_bitlen)
    end
  end
end
end