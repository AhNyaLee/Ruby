require_relative 'processing_array'

array=[1,2,3,4,4,-4,5,6,7,8,9,10,-55,-9,-3]
a=4
b=10

search_for_elements(array,a,b) 
count_for_elements(array,a,b) {|element,min| element==min}
negative_positive_numbers(array)
count_sums(array)