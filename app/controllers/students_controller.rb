class StudentsController < ApplicationController

  #only hit database once per request
  exclude_routes = %w[students/new students]
  before do
    @student = Student.find_by(id: get_id_from_path(request.path_info)) unless exclude_routes.include?(request.path_info)
  end


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
  
  get '/students/:id' do
    erb :'students/show'
  end


  private
    def get_id_from_path(path)
      #if an edit request than is different than any other request.
      if path.include?("edit")
        path.split('/')[-2].to_i
      else
        path.split('/').last.to_i
      end
    end
end
