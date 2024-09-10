puts "Как вас зовут?"
name=gets.chomp() #Получаем имя пользователя
puts ("привет %s" %name)
puts ("какой язык любимый, %s?" %name)
language=gets.chomp() #Получаем язык, которым пользуется пользователь 
# При ответе на вопрос какой язык любимый, %s?, срабатает конструкция 
#if и выскажет своё мнение на счёт языка
if language=="Ruby"
  puts ("%s-подлиза" %name)
elsif language=="c++"
  puts "Интересный выбор. Но скоро будет ruby"
elsif language=="c#"
  puts "Странный язык. НО скоро будет ruby"
else 
  puts "скоро будет ruby"
end
