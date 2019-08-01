class StaticPagesController < ApplicationController

  # GET: /static_pages/root
  get "/" do
    erb :"/static_pages/home.html"
  end

  # GET: /static_pages/about
  get "/about" do
    erb :"/static_pages/about.html"
  end

  # GET: /static_pages/contact
  get "/contact" do
    erb :"/static_pages/contact.html"
  end

  # GET: /static_pages/5/edit
  get "/static_pages/:id/edit" do
    erb :"/static_pages/edit.html"
  end

  # PATCH: /static_pages/5
  patch "/static_pages/:id" do
    redirect "/static_pages/:id"
  end

  # DELETE: /static_pages/5/delete
  delete "/static_pages/:id/delete" do
    redirect "/static_pages"
  end
end
