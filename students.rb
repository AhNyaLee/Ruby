require_relative 'person'

class Student<Person
  
  #конструктор класса
  def initialize(id:nil,surname:,name:,patronymic:,number_phone:nil,telegram:nil,email:nil,git:nil)
  self.id = id if id
  self.surname = surname
  self.name = name 
  self.patronymic = patronymic
  set_contacts(number_phone: number_phone, telegram: telegram, email: email)
  self.git = git if git
 end 

  #устанавливает значения поля или полей для введенных контактов
  def set_contacts(number_phone: nil, telegram: nil, email: nil)
    self.number = number_phone if number_phone
    self.telegram = telegram if telegram
    self.email = email if email
  end 
   
  #Проверка наличия любого контакта для связи, git 
  def validate?
    @git!=nil && @email!=nil || @telegram!=nil || @number_phone!=nil
  end

  #Вывод всех данных о студенте на экран
  def to_s
    "\nID: #{@id}\nФИО: #{full_name()} #{"\nНомер телфона: #{@number_phone}" if @number_phone} #{"\nПочта: #{@email}" if @email} #{"\nТелеграм: #{@telegram}" if @telegram} #{"\nGit: #{@git}" if @git}"
  end  

  #проверка на корректность id  
  def self.valid_id?(id)
    id.match?(/^[0-9]+$/)
  end

  #проверка на корректность ФИО
  def self.valid_surname?(surname)
    surname.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  def self.valid_name?(name)
    name.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  def self.valid_surname?(patronymic)
    patronymic.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 
  
  #проверка на корректность номера группы
  def self.valid_group?(group)
    group.match?(/^[0-9]+$/)
  end 

    #проверка на корректность номера телефона
  def self.valid_number?(number_phone)
    number_phone.match?(/^\d{11}$/)
  end

  #проверка на корректность телеграмма
  def self.valid_telegram?(telegram)
    telegram.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  #проверка на корректность почты
  def self.valid_email?(email)
    email.match?(/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}+$/)
  end

  #проверка на корректность гита
  def self.valid_git?(git)
    git.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  #private
  private
  def id(id)
    if self.class.valid_id?(id)
      @id = id
    else 
      raise ArgumentError, 'Invalid id'
    end  
  end  

  def surname=(surname)
    if self.class.valid_surname?(surname)
      @surname = surname
    else 
       raise ArgumentError, 'Invalid surname'
    end  
  end
    
  def name=(name)
    if self.class.valid_name?(name) 
      @name=name
    else 
      raise ArgumentError, 'Invalid name'
    end  
  end 

  def patronymic=(patronymic)
    if self.class.valid_surname?(patronymic)
      @patronymic=patronymic
    else 
      raise ArgumentError, 'Invalid patronymic'
    end  
  end
  
  def number=(number_phone)
    if self.class.valid_number?(number_phone)
      @number_phone = number_phone
    else 
     raise ArgumentError, 'Invalid number_phone'
    end  
  end  

   def telegram=(telegram)
    if self.class.valid_telegram?(telegram)
      @telegram = telegram
    else 
      raise ArgumentError, 'Invalid telegram'
    end  
  end  
 
   def email=(email)
    if self.class.valid_email?(email)
      @email = email
    else 
      raise ArgumentError, 'Invalid email'
    end  
  end  

   def git=(git)
    if self.class.valid_git?(git)
      @git = git
    else 
     raise ArgumentError, 'Invalid git'
    end  
  end  
end





