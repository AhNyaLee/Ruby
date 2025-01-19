require_relative 'data_list_student_short'
require_relative 'strategy'
require './data_list'
require './student_list_json'
require_relative 'data_table'

class Student_list
  attr_accessor :strategy, :students


  def initialize(strategy)
    self.strategy = strategy
    self.students = read_list_of_students
  end

  def read_list_of_students 
    self.strategy.read_list_of_students 
  end

  def write_list_of_students(students_list) 
    self.strategy.write_list_of_students 
  end


  def get_by_id(id)
    result = self.students.find do |student|
      student.id == id
    end
  end
  def count_of_rows
    @list.size
  end

  # Метод для подсчёта количества столбцов
  def count_of_columns
    return 0 if @list.empty?
    get_names.size
  end

  
  def get_k_n_student_short_list(k = 1, n = 20)
    puts "Начало get_k_n_student_short_list. k=#{k}, n=#{n}"
    
    student_count = self.students.size
    puts "Количество студентов: #{student_count}"
    
    if student_count == 0
      puts "Список студентов пуст!"
      return nil
    end
    
    max_index = [student_count, k*n].min
    
    puts "Максимальный индекс: #{max_index}"
    
    if max_index >= k * n
      student_short_list = self.students[(k-1) * n...max_index].map do |student|
        Student_short.about_student(student)
      end
      
      puts "Создано объектов Student_short: #{student_short_list.size}"
      
      data_list = Data_list_student_short.new(student_short_list)
      puts "Тип данных после создания Data_list_student_short: #{data_list.class}"
      puts "Информация о данных (1):"
      puts "Количество строк: #{data_list.count_of_rows}" if data_list
      puts "Количество столбцов: #{data_list.count_of_columns}" if data_list
   
      
    else
      puts "Недостаточно студентов для формирования списка. Требуется: #{k*n}, доступно: #{student_count}"
      return nil
    end
  end
  
  
  
  def sort 
    students_list = self.students.sort_by do |student|
      student.fullname
    end
  end
  def insert_student(student)
    students_list = self.students
    if (unique?(student))
      students_list.push(student)
    else
      raise ArgumentError, 'Student already exists'
    end
  end
  def replace_by_id(student)
    student_list = self.students.map do |object|
      if object.id == student.id
        object = student
      end
    end
  end
  def delete_by_id(id)
    student_list = self.students.delete_if do |student|
      student.id == id
    end

  end
  
  def get_student_short_count
    students_list = self.students
    students_list.count
  end

  
  
  private
  def unique?(student)
    students.none? { |student_arr| student_arr==student }
  end
 
end