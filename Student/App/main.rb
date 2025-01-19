require 'fox16'
require_relative 'Student_list_view'


include Fox

app = FXApp.new
sl = Student_list.new(JSON_strategy.new('C:/Users/Mi/Document/ruby/Student/student_list.json'))
students_list = Student_list.new(sl)
puts students_list.get_k_n_student_short_list(1, 10).get_data.count_of_rows
puts students_list.get_student_short_count
StudentListView.new(app, students_list)
app.create
app.run