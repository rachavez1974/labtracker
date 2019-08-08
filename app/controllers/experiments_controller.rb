class ExperimentsController < ApplicationController
  #only hit database once per request
  before do
    if Sessions.is_logged_in?(session)
      @current_student = Sessions.current_student(session)
    end  
  end


  get '/experiments/new' do
    if Sessions.is_logged_in?(session)
      erb :'/experiments/new'
    else
      flash[:message] = "You must be logged-in to create experiments!"
      redirect to '/login'
    end
  end

  post '/experiments' do
    if Sessions.is_logged_in?(session)
      # lab_student_id = 
    else
      flash[:message] = "You must be logged-in to create experiments!"
      redirect to '/login'
    end
  end

  # GET: /experiments
  get "/experiments/:lab_id" do
    if Sessions.is_logged_in?(session)
    student_id = Experiment.find_by(lab_id: params[:lab_id]).lab.student_id
      if student_id == @current_student.id
        @experiments =  Experiment.where("lab_id = ?", params[:lab_id])
        erb :"/experiments/index.html"
      else
        flash[:message] = "You must be account owner to see experiments!"
        redirect to '/labs'
      end
    else
      flash[:message] = "You must be logged-in to look at your experiments!"
      redirect to '/login'  
    end
  end

end
