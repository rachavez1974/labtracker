class StudentsController < ApplicationController

  get '/signup' do
    erb :'students/new'
  end

  post '/signup' do 
    @student = Student.new(params[:student])

      if @student.save
        flash[:message] = "Your account was created successfully!"
      else
        erb :'students/new'
      end
  end
  
end
