return function (self,state) 
  return self:DecodeUntilEndOfBlock(state, self._fix_block_literal_huffman_bitlen_count,
                               self._fix_block_literal_huffman_to_deflate_code, 7,
                               self._fix_block_dist_huffman_bitlen_count,
                               self._fix_block_dist_huffman_to_deflate_code, 5)
end