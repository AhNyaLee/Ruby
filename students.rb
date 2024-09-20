class Student
  attr_accessor :id, :surname, :name, :patronymic, :nomber_phone, :telegram, :email, :git

  #конструктор класса
  def initialize(information={})
    @id = information[:id]
    @surname =information[:surname] 
    @name = information[:name]
    @patronymic =information [:patronymic]
    @group=information[:group]
    self.valid_namber =information[:nomber_phone]
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
  
  def valid_namber=(nomber_phone)
    if nomber_phone.match?(/^\d{11}$/)==true
      @nomber_phone = nomber_phone
    else 
      @nomber_phone=nil
    end  
  end  

  #Вывод всех данных о студенте на экран
  def print_info
    puts ("\nID студента: #{@id}\nФИО: #{full_name} ")
    puts ("Номер руппы: #{@group}")if @nomber_phone
    puts ("Номер телефона: #{@nomber_phone}")if @nomber_phone  
    puts ("Телеграмм: #{@telegram}") if @telegram 
    puts ("Пчота: #{@email}") if @email 
    puts ("Гит: #{@git}") if @git 
  end  
end

