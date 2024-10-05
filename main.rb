require_relative 'students'

ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
  email: "example@mail.com",
  number_phone: "89182188064"

)

dasha=Student.new(
  id: "13",
  surname: "Нещадимова",
  name:"Настя",
  patronymic: "Александровна",
  number_phone: "89182188064",
  telegram: "nastia",
  email: "example@mail.com",
  git: "tamatm"
)


puts ann
puts dasha
puts dasha.validate?
puts dasha.getinfo()
