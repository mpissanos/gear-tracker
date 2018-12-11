class UsersController < ApplicationController
  
  get '/register' do 
    if !logged_in?
      erb :"user/register"
    else
      redirect to '/items'
    end
  end


  post '/register' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/register'
    else
      @user = User.new(username: params[:username], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/items'
    end
  end

  get '/login' do
    if logged_in?
      redirect to '/items/index'
    else
      erb :'/user/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/items'
    else
      erb :'/user/login'
    end
  end

  get '/logout' do 
    if session[:user_id] != nil
    session.destroy
    redirect to '/'
    else
      redirect to '/'
    end
  end

  # get '/user/:id' do
  #   @user = User.find_by_id(params[:user_id])
  #   erb :"user/show"
  # end
  

end