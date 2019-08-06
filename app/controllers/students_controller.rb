class StudentsController < ApplicationController

  #only hit database once per request
  exclude_routes = %w[/signup students]
  before do
    @student = Student.find_by(id: get_id_from_path(request.path_info)) unless exclude_routes.include?(request.path_info)
  end

  get '/signup' do
    if !Sessions.is_logged_in?(session)
      erb :'students/new'
    else
      flash[:message] = "You already have an account!"
      redirect to '/'
    end
  end

  post '/signup' do 
    if !Sessions.is_logged_in?(session)
      @student = Student.new(params[:student])
      if @student.save
        flash[:message] = "Your account was created successfully!"
      else
        @errors = @student.errors
        erb :'students/new'
      end 
    else
      flash[:message] = "You already have an account!"
      redirect to '/'
    end
  end
  
  get '/students/:id' do
    erb :'students/show'
  end

  get '/students/:id/edit' do
    if Sessions.is_logged_in?(session)
      if Sessions.current_student(session).id == params[:id].to_i
        erb :'/students/edit'
      else
        flash[:message] = "You must be account owner to edit!"
        redirect to '/'
      end
    else
      flash[:message] = "Please sign in to edit!"
      redirect to '/login'
    end
  end

  patch '/students/:id' do
    if Sessions.is_logged_in?(session)
      if Sessions.current_student(session).id == params[:id].to_i
        if @student.update(params[:student])
            redirect to "/students/#{@student.id}"
        else
            @errors = @student.errors.values.flatten
            erb :'/students/edit'
        end
      else
        flash[:message] = "You must be account owner to edit!"
        redirect to '/'
      end
    else
      flash[:message] = "Please log in to edit!"
      redirect to '/login'
    end
  end

  delete '/students/:id' do
    if Sessions.is_logged_in?(session)
      if Sessions.current_student(session).id == params[:id].to_i
        flash[:message] = "Your profile has been deleted!"
        @student.destroy
        redirect to '/signup'
      else
        flash[:message] = "You must be account owner to delete!"
        redirect to '/'
      end
    else
      flash[:message] = "Please log in to delete!"
      redirect to '/login'
    end
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
