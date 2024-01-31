return function (self,lcodes_counts,dcodes_counts) 
local lcodes_huffman_bitlens, lcodes_huffman_codes, max_non_zero_bitlen_lcode =
  self:GetHuffmanBitlenAndCode(lcodes_counts, 15, 285)
local dcodes_huffman_bitlens, dcodes_huffman_codes, max_non_zero_bitlen_dcode =
  self:GetHuffmanBitlenAndCode(dcodes_counts, 15, 29)

local rle_deflate_codes, rle_extra_bits, rle_codes_counts =
  self:RunLengthEncodeHuffmanBitlen(lcodes_huffman_bitlens,
                                max_non_zero_bitlen_lcode,
                                dcodes_huffman_bitlens,
                                max_non_zero_bitlen_dcode)

local rle_codes_huffman_bitlens, rle_codes_huffman_codes =
  self:GetHuffmanBitlenAndCode(rle_codes_counts, 7, 18)

local HCLEN = 0
for i = 1, 19 do
  local symbol = self._rle_codes_huffman_bitlen_order[i]
  local length = rle_codes_huffman_bitlens[symbol] or 0
  if length ~= 0 then HCLEN = i end
end

HCLEN = HCLEN - 4
local HLIT = max_non_zero_bitlen_lcode + 1 - 257
local HDIST = max_non_zero_bitlen_dcode + 1 - 1
if HDIST < 0 then HDIST = 0 end

return HLIT, HDIST, HCLEN, rle_codes_huffman_bitlens, rle_codes_huffman_codes,
        rle_deflate_codes, rle_extra_bits, lcodes_huffman_bitlens,
        lcodes_huffman_codes, dcodes_huffman_bitlens, dcodes_huffman_codes
end