class SessionsController < ApplicationController

  get '/login' do
    if Sessions.is_logged_in?(session)
      redirect to "/students/#{Sessions.current_student(session).id}"
    else
      erb :'/sessions/new.html'
    end
  end

  post '/login' do
    @student = Student.find_by(user_name: params[:user_name])
    if @student && @student.authenticate(params[:password])
      Sessions.log_in(@student, session)
      redirect to "/students/#{@student.id}"
    else
      erb :'/sessions/new.html'
    end
  end

  get '/logout' do
    if Sessions.is_logged_in?(session)
      Sessions.log_out(session) 
      redirect to '/login'
    else
      redirect to '/'
    end
  end
end
