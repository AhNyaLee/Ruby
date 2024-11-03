require_relative 'processing_array'

array=[1,2,3,4,5,6,7,8,9,10]


search_for_elements(array) do |x|
  puts x if x >= 4 && x <= 10
end
