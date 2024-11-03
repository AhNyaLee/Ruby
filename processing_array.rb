def search_for_elements(array, &block)
  array.each { |element| block.call(element) }
end

