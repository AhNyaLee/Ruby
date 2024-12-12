require_relative 'processing_array'
require_relative 'block'

a = 4
b = 10
array = get_array_from_input

loop do
    puts "\nВыберите действие:"
    puts "1 - Дан целочисленный массив и интервал a..b. Необходимо найти количество минимальных элементов в этом интервале."
    puts "2 - Дан целочисленный массив и отрезок a..b. Необходимо найти элементы, значение которых принадлежит этому отрезку."
    puts "3 - Дан целочисленный массив. Необходимо вывести вначале его положительные элементы, а затем - отрицательные."
    puts "4 - Для введенного списка вывести количество элементов, которые могут быть получены как сумма двух любых других элементов списка."
    puts "5 - выход"
    choice = STDIN.gets.chomp
  
    case choice
    when '1'
       print search_for_elements(array, a, b).to_s+"\n" 
    when '2'
        print count_for_elements(array, a, b).join(', ') + "\n"
    when '3'
      positive_array, negative_array=negative_positive_numbers(array)
      print "positive: " + positive_array.join(' ') + "\n"
      print "negative: " +  negative_array.join(' ') + "\n"
    when '4'         
        print count_sums(array).to_s+"\n"
    when '5'
      puts "Выход из программы."
      break
    else
      puts "Неверный ввод. Пожалуйста, выберите 1, 2, 3, 4, 5."
    end
  end