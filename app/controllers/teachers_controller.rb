class TeachersController < ApplicationController

  #only hit database once per request
  before do
    if Sessions.is_logged_in?(session)
      @current_student = Sessions.current_student(session)
    end  
  end

  # GET: /teachers/new
  get "/teachers/new/:lab_id" do
    if Sessions.is_logged_in?(session)
      @lab_id = params[:lab_id]
      erb :"/teachers/new.html"
    else
      flash[:message] = "You must be logged-in to create teachers!"
      redirect to '/login'
    end 
  end

  # POST: /teachers
  post "/teachers/:lab_id" do
    if Sessions.is_logged_in?(session)
      #get student id from lab and compare it to current_student's id
      @lab = Lab.find(params[:lab_id]) 
      if @lab.student_id == @current_student.id
        @teacher = Teacher.new(params[:teacher])
        if@teacher.save
          @lab.teacher_id = @teacher.id
          @lab.save
          flash[:message] = "A teacher for this lab was created successfully!"
          redirect to '/labs'
        else
          erb :"/teachers/new.html"
          @errors = @teacher.errors
        end
      else
        flash[:message] = "You must be a lab owner to create teachers!"
        redirect to '/labs'
      end
    else
      flash[:message] = "You must be logged-in to create teachers!"
      redirect to '/login'
    end 
  end

end
