require_relative 'processing_array'

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
    choice = gets.chomp
  
    case choice
    when '1'
        search_for_elements(array, a, b) 
    when '2'
        count_for_elements(array, a, b) { |element, min| element == min }
    when '3'
        negative_positive_numbers(array)
    when '4'         
        count_sums(array)
    when '5'
      puts "Выход из программы."
      break
    else
      puts "Неверный ввод. Пожалуйста, выберите 1, 2, 3, 4, 5."
    end
  end