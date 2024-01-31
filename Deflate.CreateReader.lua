return function (self,input_string) 
local input = input_string
local input_strlen = #input_string
local input_next_byte_pos = 1
local cache_bitlen = 0
local cache = 0
local p2 = self._pow2
local char = string.char

local function ReadBits(bitlen)
  local rshift_mask = p2[bitlen]
  local code
  if bitlen <= cache_bitlen then
    code = cache % rshift_mask
    cache = (cache - code) / rshift_mask
    cache_bitlen = cache_bitlen - bitlen
  else       local lshift_mask = p2[cache_bitlen]
    local byte1, byte2, byte3, byte4 =
      string.byte(input, input_next_byte_pos, input_next_byte_pos + 3)
          cache = cache +
              ((byte1 or 0) + (byte2 or 0) * 256 + (byte3 or 0) * 65536 +
                (byte4 or 0) * 16777216) * lshift_mask
    input_next_byte_pos = input_next_byte_pos + 4
    cache_bitlen = cache_bitlen + 32 - bitlen
    code = cache % rshift_mask
    cache = (cache - code) / rshift_mask
  end
  return code
end

local function ReadBytes(bytelen, buffer, buffer_size)
  assert(cache_bitlen % 8 == 0)

  local byte_from_cache =
    (cache_bitlen / 8 < bytelen) and (cache_bitlen / 8) or bytelen
  for _ = 1, byte_from_cache do
    local byte = cache % 256
    buffer_size = buffer_size + 1
    buffer[buffer_size] = char(byte)
    cache = (cache - byte) / 256
  end
  cache_bitlen = cache_bitlen - byte_from_cache * 8
  bytelen = bytelen - byte_from_cache
  if (input_strlen - input_next_byte_pos - bytelen + 1) * 8 + cache_bitlen < 0 then
    return -1     end
  for i = input_next_byte_pos, input_next_byte_pos + bytelen - 1 do
    buffer_size = buffer_size + 1
    buffer[buffer_size] = string.sub(input, i, i)
  end

  input_next_byte_pos = input_next_byte_pos + bytelen
  return buffer_size
end

local function Decode(huffman_bitlen_counts, huffman_symbols, min_bitlen)
  local code = 0
  local first = 0
  local index = 0
  local count
  if min_bitlen > 0 then
    if cache_bitlen < 15 and input then
      local lshift_mask = p2[cache_bitlen]
      local byte1, byte2, byte3, byte4 =
        string.byte(input, input_next_byte_pos, input_next_byte_pos + 3)
              cache = cache +
                ((byte1 or 0) + (byte2 or 0) * 256 + (byte3 or 0) * 65536 +
                  (byte4 or 0) * 16777216) * lshift_mask
      input_next_byte_pos = input_next_byte_pos + 4
      cache_bitlen = cache_bitlen + 32
    end

    local rshift_mask = p2[min_bitlen]
    cache_bitlen = cache_bitlen - min_bitlen
    code = cache % rshift_mask
    cache = (cache - code) / rshift_mask
          code = self._reverse_bits_tbl[min_bitlen][code]

    count = huffman_bitlen_counts[min_bitlen]
    if code < count then return huffman_symbols[code] end
    index = count
    first = count * 2
    code = code * 2
  end

  for bitlen = min_bitlen + 1, 15 do
    local bit
    bit = cache % 2
    cache = (cache - bit) / 2
    cache_bitlen = cache_bitlen - 1

    code = (bit == 1) and (code + 1 - code % 2) or code
    count = huffman_bitlen_counts[bitlen] or 0
    local diff = code - first
    if diff < count then return huffman_symbols[index + diff] end
    index = index + count
    first = first + count
    first = first * 2
    code = code * 2
  end
  return -10
end

local function ReaderBitlenLeft()
  return (input_strlen - input_next_byte_pos + 1) * 8 + cache_bitlen
end

local function SkipToByteBoundary()
  local skipped_bitlen = cache_bitlen % 8
  local rshift_mask = p2[skipped_bitlen]
  cache_bitlen = cache_bitlen - skipped_bitlen
  cache = (cache - cache % rshift_mask) / rshift_mask
end

return ReadBits, ReadBytes, Decode, ReaderBitlenLeft, SkipToByteBoundary
end