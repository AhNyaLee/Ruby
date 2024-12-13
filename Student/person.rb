class Person

  attr_reader :id, :git
  def initialize(id:nil,git:nil,number_phone:nil,telegram:nil,email:nil)
    self.id = id if id
    self.git = git if git
    set_contacts(number_phone: number_phone, telegram: telegram, email: email)
  end 

  #средство связи
  def contact
    if @contact.nil?
      contacts={'номер телефона: ': @number_phone, 'почта: ': @email, 'Телеграм:': @telegram}
      contact=nil
      contacts.each do |key,value|
        if !value.nil?
          contact="#{key}#{value}"
          break
        end  
      end
      contact
    else
      contact = @contact
      contact
    end
  end

    #устанавливает значения поля или полей для введенных контактов
  def set_contacts(number_phone: nil, telegram: nil, email: nil)
    self.number = number_phone if number_phone
    self.telegram = telegram if telegram
    self.email = email if email
  end 
    
  #Фамилия и Инициалы
  def fullname
    if @fullname
      @fullname
    else
      "#{@surname} #{@name} #{@patronymic}"
    end
  end

  #краткая информация о студенте
  def get_info()
    "#{fullname()}, #{contact()}, #{@git}"
  end


  # Начало провекри на корректность данных

    #проверка на корректность id  
    def self.valid_id?(id)
      id.match?(/^[0-9]+$/)
    end
  
    #проверка на корректность гита
    def self.valid_git?(git)
      git.match?(/^[A-Za-zА-Яа-яЁё]+$/)
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
  
  def id=(id)
    if self.class.valid_id?(id)
      @id = id
    else 
      raise ArgumentError, 'Invalid id'
    end  
  end 

   def git=(git)
    if self.class.valid_git?(git)
      @git = git
    else 
     raise ArgumentError, 'Invalid git'
    end  
  end 

  #private
  private
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