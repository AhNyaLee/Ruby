require_relative 'person'

class Student<Person

  include Comparable
  attr_accessor :surname, :name, :patronymic, :birthdate
  attr_reader :number_phone, :email, :telegram
  attr_accessor :unique_indicator
  #конструктор класса
  def initialize(id:nil,surname:,name:,patronymic:,number_phone:nil,telegram:nil,email:nil,git:nil,birthdate: nil, unique_indicator: :git)
    super(id: id, git: git,number_phone: number_phone, telegram: telegram, email: email)
    self.surname = surname
    self.name = name 
    self.patronymic = patronymic
    self.birthdate=birthdate
  end 

  #Проверка наличия любого контакта для связи, git 
  def has_contact_and_git?
    @git!=nil && @email!=nil || @telegram!=nil || @number_phone!=nil
  end

  def self.from_hash(hash)
    self.new(**hash.transform_keys(&:to_sym))
  end


  # Реализация сравнения студентов по дате рождения
  def <=>(other)
    if other.is_a?(Student)
      self.birthdate <=> other.birthdate
    else
      raise ArgumentError, "Can't compare #{self.class} with #{other.class}"
    end
  end

  #Вывод всех данных о студенте на экран
  def to_s
    "\nID: #{@id}\nФИО: #{@surname} #{@name} #{@patronymic} #{"\nНомер телфона: #{@number_phone}" if @number_phone} #{"\nПочта: #{@email}" if @email} #{"\nТелеграм: #{@telegram}" if @telegram} #{"\nGit: #{@git}" if @git} #{"\nдень рождения: #{@birthdate}"}"
  end  

  #проверка на корректность ФИО

  def self.valid_name?(name)
    name.match?(/^[A-Za-zА-Яа-яЁё]+$/)
  end 

  def self.birthdate?(birthdate)
    birthdate.match?(/^\d{2}\/\d{2}\/\d{4}$/)
  end 
 
  def to_h
    { id: self.id, surname: self.surname, name: self.name, patronymic: self.patronymic, 
    birthdate: self.birthdate, telegram: self.telegram, email: self.email, number_phone: self.number_phone, git: self.git }
  end

  def ==(other)
    number_phone == other.number_phone ||
    telegram == other.telegram ||
    email == other.email ||
    git == other.git
  end


  private
    def surname=(surname)
      if self.class.valid_name?(surname)
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
      if self.class.valid_name?(patronymic)
        @patronymic=patronymic
      else 
        raise ArgumentError, 'Invalid patronymic'
      end  
    end  

    def birthdate=(birthdate)
      if self.class.birthdate?(birthdate)
        @birthdate=birthdate
      else 
        raise ArgumentError, 'Invalid birthdate'
      end  
    end  

    
   
end







