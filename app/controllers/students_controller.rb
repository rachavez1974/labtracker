class StudentsController < ApplicationController

  get '/signup' do
    erb :'students/new'
  end
  
end
