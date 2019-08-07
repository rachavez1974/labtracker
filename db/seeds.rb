#create five students
6.times do |index|
  name = "Student" + "#{index}"
  class_year = ["Freshman", "Sophomore", "Junior", "Senior"]
  user_name = "#{name}index@gmail.com"
  password = "123"
  student_hash =  {
                :name => name,
                :class_year => class_year[index],
                :user_name => user_name,
                :password => password
  }
  Student.create(student_hash)
end

#create five teachers
6.times do |index|
  name = "Teacher" + "#{index}"
  department = "Departmet" + "#{index}"

  teacher_hash =  {
                :name => name,
                :department => department
  }
  Teacher.create(teacher_hash)
end

students_ids = Student.all.ids << 6 
teachers_id = Teacher.all.ids

#create 5 labs
6.times do |index|
  name = "Lab" + "#{index}"
  description = "Description #{index} " 

  lab_hash =  {
                :name => name,
                :description => description,
                :student_id => students_ids[index],
                :teacher_id => teachers_id[index]
  }
  Lab.create(lab_hash)
end


lab_ids = Lab.all.ids
#create 5 experiments
6.times do |index|
  name = "Experiment" + "#{index}"
  description = "Description of exp #{index} " 

  experiment_hash =  {
                :name => name,
                :description => description,
                :lab_id => lab_ids[index],
  }
  Experiment.create(experiment_hash)
end


