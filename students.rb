#создаём класс
class Student
  attr_accessor :id, :surname, :name, :patronymic, :git
  attr_reader :number_phone, :telegram, :email
  #конструктор класса
  def initialize(information={})
  self.valid_id = information[:id] if information[:id]
  self.valid_surname = information[:surname]
  self.valid_name = information[:name] 
  self.valid_patronymic = information[:patronymic]
  self.valid_group = information[:group] if information[:group]
  self.valid_number = information[:number_phone] if information[:number_phone]
  self.valid_telegram = information[:telegram] if information[:telegram]
  self.valid_email = information[:email] if information[:email]
  self.valid_git = information[:git] if information[:git]
end
 
  #метод set для групп
  def set_group=(new_group)
    @group=new_group
  end

  #метод get для групп 
  def get_group
    @group
  end  

  #устанавливает значения поля или полей для введенных контактов
  def set_contacts(number_phone: nil, telegram: nil, email: nil)
    self.valid_number = number_phone if number_phone
    self.valid_telegram = telegram if telegram
    self.valid_email = email if email
  end

  #запись ФИО(модифицировала класс)
  def full_name
    "#{@surname} #{@name} #{@patronymic}"
  end  
  
   #проверка на корректность id
   def valid_id=(id)
    if id.match?(/^[0-9]+$/)==true
      @id = id
    else 
      @id=nil
    end  
  end  

  #проверка на корректность ФИО
  def valid_surname=(surname)
    if surname.match?(/^[A-Za-zА-Яа-яЁё]+$/)==true  
      @surname = surname
    else 
      @surname=nil
    end  
  end   
  def valid_name=(name)
    if name.match?(/^[A-Za-zА-Яа-яЁё]+$/)==true  
      @name=name
    else 
      @name=nil
    end  
  end 
  def valid_patronymic=(patronymic)
    if patronymic.match?(/^[A-Za-zА-Яа-яЁё]+$/)==true
      @patronymic=patronymic
    else 
      @patronymic=nil
    end  
  end 

   #проверка на корректность номера группы
   def valid_group=(group)
    if group.match?(/^[0-9]+$/)==true
      @group = group
    else 
      @group=nil
    end  
  end  

  #проверка на корректность номера телефона
  def valid_number=(number_phone)
    if number_phone.match?(/^\d{11}$/)
      @number_phone = number_phone
    else 
      @number_phone=nil
    end  
  end  

   #проверка на корректность телеграмма
   def valid_telegram=(telegram)
    if telegram.match?(/^[A-Za-zА-Яа-яЁё]+$/)==true
      @telegram = telegram
    else 
      @telegram=nil
    end  
  end  

   #проверка на корректность почты
   def valid_email=(email)
    if email.match?(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}+$/)==true
      @email = email
    else 
      @email=nil
    end  
  end  

   #проверка на корректность гита
   def valid_git=(git)
    if git.match?(/^[A-Za-zА-Яа-яЁё]+$/)==true
      @git = git
    else 
      @git=nil
    end  
  end  

  #Проверка наличия git
  def validate_git
    if @git!=nil
      true
    else  
      false
    end
  end      

  
  #Проверка наличия любого контакта для связи
  def validate_contacts
    if @email!=nil || @telegram!=nil || @number_phone!=nil
      true
    else  
      false
    end
  end 

  #Вывод всех данных о студенте на экран
  def print_info
    puts ("\nID студента: #{@id}\nФИО: #{full_name} ")
    puts ("Номер руппы: #{@group}")if @group
    puts ("Номер телефона: #{@number_phone}")if @number_phone  
    puts ("Телеграмм: #{@telegram}") if @telegram 
    puts ("Почта: #{@email}") if @email 
    puts ("Гит: #{@git}") if @git 
  end  
end

