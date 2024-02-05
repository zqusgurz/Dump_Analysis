return function (self,state) 
local ReadBits, Decode = state.ReadBits, state.Decode
local nlen = ReadBits(5) + 257
local ndist = ReadBits(5) + 1
local ncode = ReadBits(4) + 4
if nlen > 286 or ndist > 30 then
      return -3
end

local rle_codes_huffman_bitlens = {}

for i = 1, ncode do
  rle_codes_huffman_bitlens[self._rle_codes_huffman_bitlen_order[i]] = ReadBits(3)
end

local rle_codes_err, rle_codes_huffman_bitlen_counts,
      rle_codes_huffman_symbols, rle_codes_huffman_min_bitlen =
  self:GetHuffmanForDecode(rle_codes_huffman_bitlens, 18, 7)
if rle_codes_err ~= 0 then         return -4
end

local lcodes_huffman_bitlens = {}
local dcodes_huffman_bitlens = {}
  local index = 0
while index < nlen + ndist do
  local symbol     local bitlen 
  symbol = Decode(rle_codes_huffman_bitlen_counts, rle_codes_huffman_symbols,
                  rle_codes_huffman_min_bitlen)

  if symbol < 0 then
    return symbol     elseif symbol < 16 then
    if index < nlen then
      lcodes_huffman_bitlens[index] = symbol
    else
      dcodes_huffman_bitlens[index - nlen] = symbol
    end
    index = index + 1
  else
    bitlen = 0
    if symbol == 16 then
      if index == 0 then
                            return -5
      end
      if index - 1 < nlen then
        bitlen = lcodes_huffman_bitlens[index - 1]
      else
        bitlen = dcodes_huffman_bitlens[index - nlen - 1]
      end
      symbol = 3 + ReadBits(2)
    elseif symbol == 17 then symbol = 3 + ReadBits(3)
    else         symbol = 11 + ReadBits(7)
    end
    if index + symbol > nlen + ndist then
                      return -6
    end
    while symbol > 0 do         symbol = symbol - 1
      if index < nlen then
        lcodes_huffman_bitlens[index] = bitlen
      else
        dcodes_huffman_bitlens[index - nlen] = bitlen
      end
      index = index + 1
    end
  end
end

if (lcodes_huffman_bitlens[256] or 0) == 0 then
      return -9
end

local lcodes_err, lcodes_huffman_bitlen_counts, lcodes_huffman_symbols,
      lcodes_huffman_min_bitlen = self:GetHuffmanForDecode(lcodes_huffman_bitlens,
                                                      nlen - 1, 15)
    if (lcodes_err ~= 0 and
  (lcodes_err < 0 or nlen ~= (lcodes_huffman_bitlen_counts[0] or 0) +
    (lcodes_huffman_bitlen_counts[1] or 0))) then return -7 end

local dcodes_err, dcodes_huffman_bitlen_counts, dcodes_huffman_symbols,
      dcodes_huffman_min_bitlen = self:GetHuffmanForDecode(dcodes_huffman_bitlens,
                                                      ndist - 1, 15)
    if (dcodes_err ~= 0 and
  (dcodes_err < 0 or ndist ~= (dcodes_huffman_bitlen_counts[0] or 0) +
    (dcodes_huffman_bitlen_counts[1] or 0))) then return -8 end

  return self:DecodeUntilEndOfBlock(state, lcodes_huffman_bitlen_counts,
                              lcodes_huffman_symbols,
                              lcodes_huffman_min_bitlen,
                              dcodes_huffman_bitlen_counts,
                              dcodes_huffman_symbols, dcodes_huffman_min_bitlen)
end