require_relative 'students'


ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
  group: "39",
  nomber_phone: "89182188064"
)

nastia=Student.new(
  id: "11",
  surname: "Нещадимова",
  name:"Настя",
  patronymic: "Александровна",
  group: "324",
  nomber_phone: "89892805804",
  telegram: "nastia",
  email: "know@mail.ru",
  git: "tamatm"
)

ann.print_info
nastia.print_info

