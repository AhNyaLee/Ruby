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
def first_positiv_number(array)
  for i in 0..array.length-1
    if array[i]>0 then
      return i
    end
  end
end

#вывод результатов 
puts "min: #{min(array)}","max: #{ max(array)}", "номер первого положительного элемента: #{first_positiv_number(array)+1}"

#выбор метода
puts "Выбирете 1-min, 2-max, 3-номер первого положительного элемента"
metod=gets.chomp
file_path =gets.chomp

array_file = File.readlines(file_path).map(&:to_i)

if metod == '1'
  puts "min: #{min(array_file)}"
elsif metod == '2'
  puts "max: #{max(array_file)}"
else
  puts "номер первого положительного элемента: #{first_positiv_number(array_file )+1}"
end
