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

#максимальная цифра числа, не делящуюся на 3
def max_figure(number)
  max=0
  until number==0
    if number%10>max && (number%10)%3!=0
      max=number%10
    end
    number/=10
  end
  max
end

def sum_figure(num)
  sum=0
  until num==0
    sum=sum+(num%10)
    num=num/10
  end
  sum
end

# Поиск не взоимно простого числа
def even(number, range)
  max= 0
  range.each do |num|
    if num>max && gcd(number, num)==1  && sum_figure(num)<5
      max=num
    end
  end
  max*number
end

# Диапазон чисел
range = (1..15)   
puts "Количество четных чисел в диапазоне от 1 до 15, не взаимно простых с #{6}: #{count_even(6, range)}"
puts "максимальная цифра 25874236974, не делящуюся на 3: #{max_figure(25874236974)}"
puts "произведение максимального числа, не взаимно простого с 6, не делящегося на наименьший делитель исходно числа, и суммы цифр числа, меньших 5: #{even(6, range)}"