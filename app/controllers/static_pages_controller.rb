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
end
