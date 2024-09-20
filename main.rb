require_relative 'students'

ann=Student.new(
  id: "12",
  surname: "Логвина",
  name:"Аня",
  patronymic: "Владимировна",
  number_phone: "89182188064"

)

nastia=Student.new(
  id: "13",
  surname: "Нещадимова",
  name:"Настя",
  patronymic: "Александровна",
  group: "324",
  number_phone: "89895804",
  telegram: "nastia",
  email: "example@mail.com",
  git: "tamatm"
)

ann.print_info
nastia.print_info
ann.set_contacts(number_phone: nil, telegram: nil, email: "new_email@example.com")
ann.print_info
