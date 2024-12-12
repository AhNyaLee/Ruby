class Processing_array
  attr_accessor :array

  def initialize(array)
    self.array = array
  end

  def count_array(value=nil,&block )
    if value.nil? && block_given?
      count = 0
      self.array.each do |element|
        if yield(element) == true
          count += 1
        end
      end
       count
    elsif !value.nil? && !block_given?
      count = 0
      self.array.each do |element|
        if element == value.to_i
          count += 1
        end
      end
      count
    else
      self.array.size
    end
  end  
  
  def filter_map_array(&block)
    if !(block_given?)
      self.array
    end
    
    result_array = Array.new()
    self.array.each do |element|
      result_array.append(block.call(element)) if !(block.call(element).nil?)
    end

   result_array
  end

  def group_by_array(value=nil,&block)
    if !(block_given?)
      return self.array
    end

    hash = {}
    self.array.each do |element|
      key = yield(element)
      if hash[key].nil?
        hash[key] = [element]
      else
        hash[key].append(element)
      end
    end

    return hash
  end 

  def min_array
    min = self.array[0]
    self.array.each do |element|
      min = element if element < min  
    end
    min 
  end

  def partition_array(&block)
    if !(block_given?)
      return self.array
    end

    true_array=[]
    false_arra=[]

    self.array.each do |element|
      if yield(element)
        true_array.append(element)
      else
        false_arra.append(element)
      end
    end
    [true_array,false_arra]       
  end 

  def take_while_array(&block)
    if !(block_given?)
      return self.array
    end

    new_array=[]
    self.array.each do |element|
      if yield(element) == false
        break
      end
      new_array.append(element)
    end
    new_array
  end  

end

array = Processing_array.new([5,7,8,1, 2, 3, 4, 5, 2, 3, -55])


puts "Количество элементов больше 3: #{array.count_array() do |element| element >3 end}"

puts "Вывод чётных чисел: #{array.filter_map_array { |element| element if element.even?}}"

puts "Вывод чётных чисел: #{array.group_by_array { |element| element.even?}}"

puts "min= #{array.min_array}"

puts "Чётные числа: #{array.partition_array { |element| element.even?}}"

puts "элементы больше 4: #{array.take_while_array{ |element| element > 4 }}"
