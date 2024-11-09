def search_for_elements(array,a,b)
   filtered = array.grep(a..b)
   min = filtered.min
   print filtered.count(min).to_s+"\n"
end

def count_for_elements(array,a,b)
  results = array.grep(a..b)
  print results.join(' ') + "\n"    
end

def negative_positive_numbers(array)
  positive_array= array.select(&:positive?)
  print "positive: " + positive_array.join(' ') + "\n"
  negative_array=array.select(&:negative?)
  print "negative: " +  negative_array.join(' ') + "\n"
end

def count_sums(array)
  sums = Set.new
  array.combination(2).map { |x, y| sums.add(x + y) }
  print sums.count { |sum| array.include?(sum) }.to_s + "\n"
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