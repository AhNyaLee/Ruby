require_relative 'students'


ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
 namber_phone: "g82188064"
)

nastia=Student.new(
  id: "12",
  surname: "Нещадимова",
  name:"Настя",
  patronymic: "Александровна",
  group: "324",
  namber_phone: "89892805804",
  telegram: "nastia",
  email: "example@mail.com",
  git: "tamatm"
)

ann.print_info
nastia.print_info
