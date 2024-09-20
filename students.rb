class Student
  attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git

  #конструктор класса
  def initialize(id:nil, surname:, name:, patronymic:,group:,nomber_phone:nil, telegram: nil, email: nil, git:nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @group=group
    @nomber_phone = nomber_phone
    @telegram = telegram
    @email = email
    @git = git
  end
 
  #метод set для групп
  def set_group=(new_group)
    @group=new_group
  end

  #метод get для групп 
  def get_group
    @group
  end  

  def full_name
    "#{@surname} #{@name} #{@patronymic}"
  end  
  
  #Вывод всех данных о студенте на экран
  def print_info
    puts ("\nID студента: #{@id}\nФИО: #{full_name} ")
    puts ("Номер руппы: #{@group}")
    puts ("Номер телефон: #{@nomber_phone}") if @nomber_phone  
    puts ("Телеграмм: #{@telegram}") if @telegram 
    puts ("Пчота: #{@email}") if @email 
    puts ("Гит: #{@git}") if @git 
  end  
end

