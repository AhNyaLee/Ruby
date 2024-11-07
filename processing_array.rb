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

def count_sums(array)
  sums = Set.new  
  count = 0

  array.combination(2) do |a, b|
    sums.add(a + b)
  end

  array.each do |element|
    count += 1 if sums.include?(element)
  end
    print count.to_s + "\n"
end

def get_array_from_input
  puts "1 - Чтение массива из файла"
  puts "2 - Ввод массива с клавиатуры"
  input = gets.chomp

  if input == '1'
    puts "Введите имя файла:"
    filename = gets.chomp
    array = File.readlines(filename).map(&:to_i)
    print array.join(' ') + "\n"
  elsif input == '2'
    puts "Введите числа через пробел:"
    array = gets.chomp.split.map(&:to_i)
  else
    puts "Неверный ввод. Пожалуйста, выберите 1 или 2."
    return get_array_from_input
  end
  array
end