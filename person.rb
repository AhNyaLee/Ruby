class Person

  #запись ФИО
  def full_name
    "#{@surname} #{@name} #{@patronymic}"
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
  
  #краткая информация о студенте
  def getinfo()
    "#{get_fullname()}" " #{get_contacts()}" " #{get_git()}"
  end

  #Фамилия и Инициалы
  def get_fullname()
    "#{"ФИО: #{@surname} #{@name[0]} #{@patronymic[0]}"}"
  end  

  #git
  def get_git()
    "#{"Git:  #{@git} "}"
  end

end