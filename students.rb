require_relative 'person'

class Student<Person
  attr_accessor :surname, :name, :patronymic
  attr_reader :number_phone, :telegram, :email

  #конструктор класса
  def initialize(id:nil,surname:,name:,patronymic:,number_phone:nil,telegram:nil,email:nil,git:nil)
  super(id: id, git: git)
  set_contacts(number_phone: number_phone, telegram: telegram, email: email)
  self.surname = surname
  self.name = name 
  self.patronymic = patronymic
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
    "\nID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic} #{"\nНомер телфона: #{@number_phone}" if @number_phone} #{"\nПочта: #{@email}" if @email} #{"\nТелеграм: #{@telegram}" if @telegram} #{"\nGit: #{@git}" if @git}"
  end  
  
# Начало провекри на корректность данных
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
# конец провекри на корректность данных  

  private
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
end







