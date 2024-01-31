return function (self,symbol_counts,max_bitlen,max_symbol) 
local heap_size
local max_non_zero_bitlen_symbol = -1
local leafs = {}
local heap = {}
local symbol_bitlens = {}
local symbol_codes = {}
local bitlen_counts = {}

--[[
  tree[1]: weight, temporarily used as parent and bitLengths
  tree[2]: symbol
  tree[3]: left child
  tree[4]: right child
--]]
local number_unique_symbols = 0
for symbol, count in pairs(symbol_counts) do
  number_unique_symbols = number_unique_symbols + 1
  leafs[number_unique_symbols] = {count, symbol}
end

if (number_unique_symbols == 0) then
      return {}, {}, -1
elseif (number_unique_symbols == 1) then
                  local symbol = leafs[1][2]
  symbol_bitlens[symbol] = 1
  symbol_codes[symbol] = 0
  return symbol_bitlens, symbol_codes, symbol
else
  table.sort(leafs, function(a,b) return self:SortByFirstThenSecond(a,b) end)
  heap_size = number_unique_symbols
  for i = 1, heap_size do heap[i] = leafs[i] end

  while (heap_size > 1) do
    local leftChild = self:MinHeapPop(heap, heap_size)
    heap_size = heap_size - 1
    local rightChild = self:MinHeapPop(heap, heap_size)
    heap_size = heap_size - 1
    local newNode = {leftChild[1] + rightChild[1], -1, leftChild, rightChild}
    self:MinHeapPush(heap, newNode, heap_size)
    heap_size = heap_size + 1
  end
  local number_bitlen_overflow = 0
  local fifo = {heap[1], 0, 0, 0}
  local fifo_size = 1
  local index = 1
  heap[1][1] = 0
  while (index <= fifo_size) do
	local e = fifo[index]
    local bitlen = e[1]
    local symbol = e[2]
    local left_child = e[3]
    local right_child = e[4]
    if left_child then
      fifo_size = fifo_size + 1
      fifo[fifo_size] = left_child
      left_child[1] = bitlen + 1
    end
    if right_child then
      fifo_size = fifo_size + 1
      fifo[fifo_size] = right_child
      right_child[1] = bitlen + 1
    end
    index = index + 1

    if (bitlen > max_bitlen) then
      number_bitlen_overflow = number_bitlen_overflow + 1
      bitlen = max_bitlen
    end
		
    if symbol >= 0 then
      symbol_bitlens[symbol] = bitlen
      max_non_zero_bitlen_symbol = (symbol > max_non_zero_bitlen_symbol) and
                                      symbol or max_non_zero_bitlen_symbol
      bitlen_counts[bitlen] = (bitlen_counts[bitlen] or 0) + 1
    end

  end

  if (number_bitlen_overflow > 0) then
    repeat
      local bitlen = max_bitlen - 1
      while ((bitlen_counts[bitlen] or 0) == 0) do bitlen = bitlen - 1 end
              bitlen_counts[bitlen] = bitlen_counts[bitlen] - 1
              bitlen_counts[bitlen + 1] = (bitlen_counts[bitlen + 1] or 0) + 2
      bitlen_counts[max_bitlen] = bitlen_counts[max_bitlen] - 1
      number_bitlen_overflow = number_bitlen_overflow - 2
    until (number_bitlen_overflow <= 0)

    index = 1
    for bitlen = max_bitlen, 1, -1 do
      local n = bitlen_counts[bitlen] or 0
      while (n > 0) do
        local symbol = leafs[index][2]
        symbol_bitlens[symbol] = bitlen
        n = n - 1
        index = index + 1
      end
    end
  end

  symbol_codes = self:GetHuffmanCodeFromBitlen(bitlen_counts, symbol_bitlens,
                                          max_symbol, max_bitlen)
  return symbol_bitlens, symbol_codes, max_non_zero_bitlen_symbol
end
end