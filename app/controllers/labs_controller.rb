class LabsController < ApplicationController
  #only hit database once per request
  
  before do
    if Sessions.is_logged_in?(session)
      @current_student = Sessions.current_student(session)
    end  
  end

  # GET: /labs
  get "/labs" do
    if Sessions.is_logged_in?(session)
      @labs = @current_student.labs 
      erb :"/labs/index.html"
    else
      flash[:message] = "You must be logged-in to look at your labs!"
      redirect to '/login'
    end
  end

  # GET: /labs/new
  get "/labs/new" do
    if Sessions.is_logged_in?(session)
      erb :"/labs/new.html"
    else
      flash[:message] = "You must be logged-in to create labs!"
      redirect to '/login'
    end
  end

  # POST: /labs
  post "/labs" do
    if Sessions.is_logged_in?(session)
      @lab = Lab.new(params[:lab])
      @lab.student_id = @current_student.id
        if @lab.save
          flash[:message] = "Your lab was created successfully!"
          redirect "/labs/#{@lab.id}"
        else
          @errors = @lab.errors
          erb :'/labs/new.html'
        end
    else
      flash[:message] = "You must be logged-in to create labs!"
      redirect to '/login'
    end
  end

  # GET: /labs/5
  get "/labs/:id" do
    erb :"/labs/show.html"
  end

  # GET: /labs/5/edit
  get "/labs/:id/edit" do
    erb :"/labs/edit.html"
  end

  # PATCH: /labs/5
  patch "/labs/:id" do
    redirect "/labs/:id"
  end

  # DELETE: /labs/5/delete
  delete "/labs/:id/delete" do
    redirect "/labs"
  end
end
