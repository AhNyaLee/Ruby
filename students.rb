class Student
  attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git

  #конструктор класса
  def initialize(information={})
    @id = information[:id]
    @surname =information[:surname] 
    @name = information[:name]
    @patronymic =information [:patronymic]
    @group=information[:group]
    @nomber_phone =information[:nomber_phone]
    @telegram = information[:telegram]
    @email = information[:email]
    @git =information[:git] 
  end
 
  #метод set для групп
  def set_group=(new_group)
    @group=new_group
  end

  #метод get для групп 
  def get_group
    @group
  end  

  #запись ФИО(модифицировала класс)
  def full_name
    "#{@surname} #{@name} #{@patronymic}"
  end  
  
  #Вывод всех данных о студенте на экран
  def print_info
    puts ("\nID студента: #{@id}\nФИО: #{full_name} ")
    puts ("Номер руппы: #{@group}")if @nomber_phone
    puts ("Номер телефон: #{@nomber_phone}") if @nomber_phone  
    puts ("Телеграмм: #{@telegram}") if @telegram 
    puts ("Пчота: #{@email}") if @email 
    puts ("Гит: #{@git}") if @git 
  end  
end

