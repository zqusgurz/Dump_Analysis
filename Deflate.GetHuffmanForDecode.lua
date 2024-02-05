return function (self,huffman_bitlens,max_symbol,max_bitlen) 
local huffman_bitlen_counts = {}
local min_bitlen = max_bitlen
for symbol = 0, max_symbol do
  local bitlen = huffman_bitlens[symbol] or 0
  min_bitlen = (bitlen > 0 and bitlen < min_bitlen) and bitlen or min_bitlen
  huffman_bitlen_counts[bitlen] = (huffman_bitlen_counts[bitlen] or 0) + 1
end

if huffman_bitlen_counts[0] == max_symbol + 1 then     return 0, huffman_bitlen_counts, {}, 0   end

local left = 1
for len = 1, max_bitlen do
  left = left * 2
  left = left - (huffman_bitlen_counts[len] or 0)
  if left < 0 then
    return left     end
end

  local offsets = {}
offsets[1] = 0
for len = 1, max_bitlen - 1 do
  offsets[len + 1] = offsets[len] + (huffman_bitlen_counts[len] or 0)
end

local huffman_symbols = {}
for symbol = 0, max_symbol do
  local bitlen = huffman_bitlens[symbol] or 0
  if bitlen ~= 0 then
    local offset = offsets[bitlen]
    huffman_symbols[offset] = symbol
    offsets[bitlen] = offsets[bitlen] + 1
  end
end

return left, huffman_bitlen_counts, huffman_symbols, min_bitlen
end