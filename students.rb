require_relative 'person'

class Student<Person
  attr_accessor :surname, :name, :patronymic

  #конструктор класса
  def initialize(id:nil,surname:,name:,patronymic:,number_phone:nil,telegram:nil,email:nil,git:nil)
    super(id: id, git: git,number_phone: number_phone, telegram: telegram, email: email)
    self.surname = surname
    self.name = name 
    self.patronymic = patronymic
  end 

  #Проверка наличия любого контакта для связи, git 
  def has_contact_and_git?
    @git!=nil && @email!=nil || @telegram!=nil || @number_phone!=nil
  end

  #Вывод всех данных о студенте на экран
  def to_s
    "\nID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic} #{"\nНомер телфона: #{@number_phone}" if @number_phone} #{"\nПочта: #{@email}" if @email} #{"\nТелеграм: #{@telegram}" if @telegram} #{"\nGit: #{@git}" if @git}"
  end  

  #проверка на корректность ФИО
  def self.valid_surname?(surname)
    surname.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  def self.valid_name?(name)
    name.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  def self.valid_patronymic?(patronymic)
    patronymic.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end  

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
      if self.class.valid_patronymic?(patronymic)
        @patronymic=patronymic
      else 
        raise ArgumentError, 'Invalid patronymic'
      end  
    end  
end







