def search_for_elements(array,a,b)
  results = array.select { |x| x >= a && x <= b }
  print results.join(' ') + "\n"    
end

def count_for_elements(array,a,b)
  new_array=array.select  {|element|  element if element>=a && element<=b}
  min=new_array.min
  count=0
  new_array.each do |element|
    count+=1 if yield(element,min)
  end
   print count.to_s + "\n"
end

def negative_positive_numbers(array)
  positive_array=array.select {|element| element if element>=0}
  print "positive: " + positive_array.join(' ') + "\n"
  negative_array=array.select {|element| element  if element<0}
  print "negative: " +  negative_array.join(' ') + "\n"
end