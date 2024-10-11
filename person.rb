class Person

  attr_accessor :id, :git

  def initialize(id:nil,number_phone:nil,telegram:nil,email:nil,git:nil)
    self.id = id if id
    self.git = git if git
   end 

  #средство связи
  def get_contacts()
    contacts={'номер телефона: ': @number_phone, 'почта: ': @email, 'Телеграм:': @telegram}
    contact=nil
    contacts.each do |key,value|
      if !value.nil?
        contact="#{key}#{value}"
        break
      end  
    end
    contact
  end

  #Фамилия и Инициалы
  def get_fullname()
    "#{@surname} #{@name[0]} #{@patronymic[0]}"
  end  

  #git
  def get_git()
    "#{@git}"
  end

  #краткая информация о студенте
  def getinfo()
    "#{get_fullname()}, #{get_contacts()}, #{get_git()}"
  end

    #проверка на корректность id  
    def self.valid_id?(id)
      id.match?(/^[0-9]+$/)
    end
  
    #проверка на корректность гита
    def self.valid_git?(git)
      git.match?(/^[A-Za-zА-Яа-яЁё]+$/)
    end 

  #private
  private
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
end