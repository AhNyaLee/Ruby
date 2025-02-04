require_relative 'db/pg_client'
require_relative 'students'
require_relative 'student_short'
class Student_list_DB

  attr_accessor :client 

  def initialize
    self.client = PG_client.instance
  end

  def get_by_id(id)
    result = client.exec_params("SELECT * FROM students WHERE id = $1", [id])
    raise "Student with id=#{id} not found" if result.ntuples.zero?
    Student.from_hash(result[0]) 
  end

  def get_k_n_student_short_list(k = 1, n = 20)
    k = 1 if k < 1
    offset = (k - 1) * n
    result = client.exec_params(
      "SELECT id, surname, name, second_name FROM students ORDER BY id LIMIT $1 OFFSET $2",
      [n, offset]
    )
    if result.ntuples.zero?
      raise IndexError, 'Index out of range'
    end
    student_short_list = result.map do |row|
      Short_student.from_student(Student.from_hash(row))
    end
    Data_list_student_short.new(student_short_list)
  end


  def sort(field = 'surname')
    result = client.exec("SELECT * FROM students ORDER BY #{field}")
    result.map { |row| row } 
  end
  # Вставка нового студента
  def insert_student(student)
    client.exec_params(
      "INSERT INTO students (surname, name, second_name, birthdate, phone, telegram, email, git) VALUES ($1, $2, $3, $4, $5, $6, $7, $8)",
      [
        student.surname,
        student.name,
        student.patronymic,
        student.birthdate,
        student.number_phone,
        student.telegram,
        student.email,
        student.git
      ]
    )
  end
  # Замена студента по ID
  def replace_by_id(student)
    client.exec_params(
      "UPDATE students SET surname = $1, name = $2, second_name = $3, birthdate = $4, phone = $5, telegram = $6, email = $7, git = $8 WHERE id = $9",
      [
        student.surname,
        student.name,
        student.patronymic,
        student.birthdate,
        student.number_phone,
        student.telegram,
        student.email,
        student.git,
        student.id
      ]
    )
  end
  # Удаление студента по ID
  def delete_by_id(id)
    client.exec_params("DELETE FROM students WHERE id = $1", [id])
  end
  # Получить общее количество записей в таблице студентов
  def get_student_short_count
    result = client.exec("SELECT COUNT(*) FROM students")
    result[0]['count'].to_i
  end

  private
  def unique_student?(student)
    unigue_git?(student.git) && unique_phone?(student.phone) && unique_email?(student.email) && unique_telegram?(student.telegram)
  end
  def unigue_git?(git)
    unique_attr?(:git, git)
  end
  def unique_phone?(phone)
    unique_attr?(:phone, phone)
  end
  def unique_email?(email)
    unique_attr?(:email, email)
  end
  def unique_telegram?(telegram)
    unique_attr?(:telegram, telegram)
  end
  def unique_attr?(symbol, value)
    tree = Binary_tree.new
    self.strategy.read_list_of_students.each do |student|
      student.unique_indicator = symbol
      tree.add(student)
    end
    tree.iterator.each do |student|
      if student.unique_indicator == value
        return false
      end
    end
    true
  end 
end