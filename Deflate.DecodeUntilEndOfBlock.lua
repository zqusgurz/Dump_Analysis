return function (self,state,lcodes_huffman_bitlens,lcodes_huffman_symbols,lcodes_huffman_min_bitlen,dcodes_huffman_bitlens,dcodes_huffman_symbols,dcodes_huffman_min_bitlen) 
local buffer, buffer_size, ReadBits, Decode, ReaderBitlenLeft, result_buffer =
  state.buffer, state.buffer_size, state.ReadBits, state.Decode,
  state.ReaderBitlenLeft, state.result_buffer
local dictionary = state.dictionary
local dict_string_table
local dict_strlen
local btc = self._byte_to_char

local buffer_end = 1
if dictionary and not buffer[0] then
              dict_string_table = dictionary.string_table
  dict_strlen = dictionary.strlen
  buffer_end = -dict_strlen + 1
  for i = 0, (-dict_strlen + 1) < -257 and -257 or (-dict_strlen + 1), -1 do
    buffer[i] = btc[dict_string_table[dict_strlen + i]]
  end
end

repeat
  local symbol = Decode(lcodes_huffman_bitlens, lcodes_huffman_symbols,
                        lcodes_huffman_min_bitlen)
  if symbol < 0 or symbol > 285 then
          return -10
  elseif symbol < 256 then       buffer_size = buffer_size + 1
    buffer[buffer_size] = btc[symbol]
  elseif symbol > 256 then       symbol = symbol - 256
    local bitlen = self._literal_deflate_code_to_base_len[symbol]
    bitlen = (symbol >= 8) and
                (bitlen +
                  ReadBits(self._literal_deflate_code_to_extra_bitlen[symbol])) or
                bitlen
    symbol = Decode(dcodes_huffman_bitlens, dcodes_huffman_symbols,
                    dcodes_huffman_min_bitlen)
    if symbol < 0 or symbol > 29 then
              return -10
    end
    local dist = self._dist_deflate_code_to_base_dist[symbol]
    dist = (dist > 4) and
              (dist + ReadBits(self._dist_deflate_code_to_extra_bitlen[symbol])) or
              dist

    local char_buffer_index = buffer_size - dist + 1
    if char_buffer_index < buffer_end then
              return -11
    end
    if char_buffer_index >= -257 then
      for _ = 1, bitlen do
        buffer_size = buffer_size + 1
        buffer[buffer_size] = buffer[char_buffer_index]
        char_buffer_index = char_buffer_index + 1
      end
    else
      char_buffer_index = dict_strlen + char_buffer_index
      for _ = 1, bitlen do
        buffer_size = buffer_size + 1
        buffer[buffer_size] =
          btc[dict_string_table[char_buffer_index]]
        char_buffer_index = char_buffer_index + 1
      end
    end
  end

  if ReaderBitlenLeft() < 0 then
    return 2     end

  if buffer_size >= 65536 then
    result_buffer[#result_buffer + 1] = table.concat(buffer, "", 1, 32768)
    for i = 32769, buffer_size do buffer[i - 32768] = buffer[i] end
    buffer_size = buffer_size - 32768
    buffer[buffer_size + 1] = nil
              end
until symbol == 256

state.buffer_size = buffer_size

return 0
end