array=[-3,-1,4,5,10,-24,34]

#минимальный элемент массива
def min(array)
  min=array[0]
  for i in 0..array.length-1
    if min>array[i] then
      min=array[i]
    end
  end
  min
end

#максимальный элемент массива
def max(array)
  max=array[0]
  i=0
  while i<array.length
    if max<array[i] then
      max=array[i]
    end
    i=i+1
  end
  max
end

#номер первого положительного элемента
def positiv_number(array)
  for i in 0..array.length-1
    if array[i]>0 then
      return i
    end
  end
end

#вывод результатов 
puts "min: #{min(array)}","max: #{ max(array)}", "номер первого положительного элемента: #{positiv_number(array)+1}"