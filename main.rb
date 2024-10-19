require_relative 'students'
require_relative 'student_short'

ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
  email: "example@mail.com",
  git: "sdfghjk",
  number_phone: "89182188064"

)

dasha=Student.new(
  id: "13",
  surname: "Нещадимова",
  name:"Даша",
  patronymic: "Александровна",
  number_phone: "89182188064",
  telegram: "nastia",
  git: "tamatm",
  email: "example@mail.com"
  
)


puts ann
puts dasha
puts dasha.get_info
dasha_short=Student_short.about_student(dasha)
ann_short=Student_short.from_sting(id: ann.id, string: ann.get_info)
puts dasha_short
puts ann_short