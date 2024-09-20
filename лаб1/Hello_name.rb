#Получаем имя пользователя
name=ARGV[0]
puts "привет %s" %name

#Получаем язык, которым пользуется пользователь 
puts ("какой язык любимый?")
program_language=STDIN.gets.chomp 

# При ответе на вопрос какой язык любимый?, срабатает конструкция 
#if и выскажет своё мнение на счёт языка
if program_language=="Ruby"
  puts ("подлиза")
elsif program_language=="c++"
  puts "Интересный выбор. Но скоро будет ruby"
elsif program_language=="c#"
  puts "Странный язык. НО скоро будет ruby"
else 
  puts "скоро будет ruby"
end
puts "введите команду языка ruby"
ruby_command = ""

# запись всех команд которые будут введены, в переменную ruby_command
while (line = STDIN.gets.chomp) != 'end'
  ruby_command += line + "\n"
end

# Выполнение команды Ruby
begin
  eval(ruby_command)
rescue StandardError => error 
  puts "Ошибка выполнения команды Ruby: #{error.message}"
end

puts "введите команду OC" 
oc_command = ""

# запись всех команд которые будут введены, в переменную oc_command
while (line = STDIN.gets.chomp) != 'end'
  oc_command += line + "\n"
end

# Выполнение команды ОС
begin
  puts `#{oc_command}`
rescue StandardError => error 
  puts "Ошибка выполнения команды Ruby: #{error.message}"
end