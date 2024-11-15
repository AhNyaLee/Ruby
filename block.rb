def search_for_elements(array,a,b)
   filtered = array.grep(a..b)
   min = filtered.min
   filtered.count(min)
end

def count_for_elements(array,a,b)
  results = array.grep(a..b)
  results   
end

def negative_positive_numbers(array)
  positive_array= array.select(&:positive?)
  negative_array=array.select(&:negative?)
  [positive_array,negative_array]
end

def count_sums(array)
  sums = Set.new
  array.combination(2).map { |x, y| sums.add(x + y) }
  sums.count { |sum| array.include?(sum) }
end

def get_array_from_input
  puts "1 - Чтение массива из файла"
  puts "2 - Ввод массива с клавиатуры"
  input = STDIN.gets.chomp

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
  end
  array
end