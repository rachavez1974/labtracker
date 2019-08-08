

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
    Student.create(student_hash).id
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

  #grab ids to populate belongs to relationship
  students_ids = Student.all.ids
  teachers_ids = Teacher.all.ids

#create labs with mix students, and teachers
  4.times do |index|
      name = "Lab" + "#{index}"
      description = "Description #{index}"
      #create two labs with same student, and two different teachers
      2.times do
        lab_hash =  {
                      :name => name,
                      :description => description,
                      :student_id => students_ids[index],
                      :teacher_id => teachers_ids[index + 1]
                      }
        Lab.create(lab_hash)
      end

      2.times do
        lab_hash =  {
                      :name => name,
                      :description => description,
                      :student_id => students_ids[index + 1],
                      :teacher_id => teachers_ids[index]
                      }
        Lab.create(lab_hash)
      end
  end

  lab_ids = Lab.all.ids
  #create mix experiments with labs
  3.times do |index|
    name = "Experiment" + "#{index}"
    description = "Description of exp #{index} " 

    #same student different labs
    2.times do
      experiment_hash =  {
                          :name => name,
                          :description => description,
                          :lab_id => lab_ids[index + 1],
                          }
      Experiment.create(experiment_hash)
    end

    #same labs different student
    2.times do
      experiment_hash =  {
                          :name => name,
                          :description => description,
                          :lab_id => lab_ids[index],
                          }
      Experiment.create(experiment_hash)
    end
  end
  
  