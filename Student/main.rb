require_relative 'students'
require_relative 'student_short'
require_relative 'byniretree'
require_relative 'data_list_student_short'
require_relative 'student_list_json'
require_relative 'student_list_yaml'
require_relative 'FileHandler'
require_relative 'db/pg_client.rb'
require_relative 'student_list_db'

ann=Student.new(
  id: "14",
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


ann_short=Student_short.from_sting(id: ann.id, string: ann.get_info)
puts "#4:"
data_table = Data_table.new([[]])


data_list = Data_list_student_short.new([ann_short])

data_list.get_data
puts data_list.row_from_attrs(ann_short)

data_list.select(0)
result =  data_list.get_data.get_by_index(0, 1)
puts result




sl = Student_list.new 
sl.strategy = YAML_strategy.new('tudents_list.yaml')

temp = sl.get_k_n_student_short_list(1, 2)
temp.select(1)
puts temp.get_data.count_of_rows

sldb = Student_list_DB.new
sldb.client.exec("select * from students").each do |row|
  puts row
end

puts sldb.get_student_short_count
