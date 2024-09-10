#Получаем имя пользователя
puts "Как вас зовут?"
name=gets.chomp
puts ("привет %s" %name)

#Получаем язык, которым пользуется пользователь 
puts ("какой язык любимый, %s?" %name)
program_language=gets.chomp 

# При ответе на вопрос какой язык любимый, %s?, срабатает конструкция 
#if и выскажет своё мнение на счёт языка
if program_language=="Ruby"
  puts ("%s-подлиза" %name)
elsif program_language=="c++"
  puts "Интересный выбор. Но скоро будет ruby"
elsif program_language=="c#"
  puts "Странный язык. НО скоро будет ruby"
else 
  puts "скоро будет ruby"
end
puts "%s, введите команду языка ruby" %name
ruby_command = ""

# запись всех команд которые будут введены, в переменную ruby_command
while (line = gets.chomp) != 'end'
  ruby_command += line + "\n"
end

# Выполнение команды Ruby
begin
  eval(ruby_command)
rescue StandardError => error 
  puts "Ошибка выполнения команды Ruby: #{error.message}"
end

puts "%s, введите команду OC" % name
oc_command = ""

# запись всех команд которые будут введены, в переменную oc_command
while (line = gets.chomp) != 'end'
  oc_command += line + "\n"
end

# Выполнение команды ОС
begin
  puts `#{oc_command}`
rescue StandardError => error 
  puts "Ошибка выполнения команды Ruby: #{error.message}"
end