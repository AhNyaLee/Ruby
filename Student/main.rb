require_relative 'students'
require_relative 'student_short'
require_relative 'byniretree'


ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
  email: "example@mail.com",
  git: "sdfghjk",
  number_phone: "89182188064",
  birthdate: "12/03/2012"

)

dasha=Student.new(
  id: "13",
  surname: "Нещадимова",
  name:"Даша",
  patronymic: "Александровна",
  number_phone: "89182188064",
  telegram: "nastia",
  git: "tamatm",
  email: "example@mail.com",
  birthdate: "12/03/2004"
)


puts ann
puts dasha
puts ann.birthdate
puts dasha.birthdate

puts ann.birthdate > dasha.birthdate

tree = BinaryTree.new
tree.add(ann)
tree.add(dasha)

tree.iterator.each do |node|
	puts node.name
end