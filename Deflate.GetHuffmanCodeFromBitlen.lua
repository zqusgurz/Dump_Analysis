return function (self,bitlen_counts,symbol_bitlens,max_symbol,max_bitlen) 
local huffman_code = 0
local next_codes = {}
local symbol_huffman_codes = {}
for bitlen = 1, max_bitlen do
  huffman_code = (huffman_code + (bitlen_counts[bitlen - 1] or 0)) * 2
  next_codes[bitlen] = huffman_code
end
for symbol = 0, max_symbol do
  local bitlen = symbol_bitlens[symbol]
  if bitlen then
    huffman_code = next_codes[bitlen]
    next_codes[bitlen] = huffman_code + 1

    if bitlen <= 9 then
  symbol_huffman_codes[symbol] = self._reverse_bits_tbl[bitlen][huffman_code]
    else
      local reverse = 0
      for _ = 1, bitlen do
        reverse = reverse - reverse % 2 +
                    (((reverse % 2 == 1) or (huffman_code % 2) == 1) and 1 or
                      0)
        huffman_code = (huffman_code - huffman_code % 2) / 2
        reverse = reverse * 2
      end
      symbol_huffman_codes[symbol] = (reverse - reverse % 2) / 2
    end
  end
end
return symbol_huffman_codes
end