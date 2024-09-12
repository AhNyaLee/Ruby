# Функция для вычисления НОД
def gcd(a, b)
  while b != 0
    a, b = b, a % b
  end
  a
end

#количество четных чисел, не взаимно простых 
def count_even(number, range)
  count = 0

  range.each do |num|
    if num.even? && gcd(number, num) != 1
      count += 1
    end
  end

  count
end

#число, которое мы сравниваем сдругими 
number = 6  

# Диапазон чисел
range = (1..15)   
puts "Количество четных чисел в диапазоне от 1 до 15, не взаимно простых с #{number}: #{count_even(number, range)}"
