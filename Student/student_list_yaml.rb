require 'yaml'
require 'date'
require_relative 'student_short'
require_relative 'students'
require_relative 'FileHandler'

class Student_list_YAML<FileHandler
  def read_list_of_students
    file = File.read(self.path)
    raise 'File is empty' if file.strip.empty?
    YAML.safe_load(file, symbolize_names: true, permitted_classes: [Date, Symbol]).map do |object|
      Student.new(**object)
    end
  end
  def write_list_of_students(list)
    data = list.map do |object|
      object.to_h
    end
    File.open(self.path, 'w') do |file|
      file.write(data.to_yaml)
    end
  end
end