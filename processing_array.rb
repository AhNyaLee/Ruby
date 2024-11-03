def search_for_elements(array,a,b)
  array.each do |x|
    puts x if x >= a && x <= b
  end  
end

def count_for_elements(array,a,b)
  new_array=array.select  {|element|  element if element>=a && element<=b}
  min=new_array.min
  count=0
  new_array.each do |element|
    count+=1 if yield(element,min)
  end
   puts count
end