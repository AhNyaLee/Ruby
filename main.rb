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
  name:"Дашап",
  patronymic: "Александровна",
  number_phone: "89182188064",
  telegram: "nastia",
  git: "tamatm",
  email: "example@mail.com"
  
)


puts ann
puts dasha
puts dasha.getinfo
dashaD=Student_short.about_student(dasha)
annA=Student_short.from_sting(id: ann.id, string: ann.getinfo)
puts dashaD
puts annA