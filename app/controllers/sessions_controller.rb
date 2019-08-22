class SessionsController < ApplicationController

  def new
  end

  def create
    puts params.inspect
    user = User.find_by_name(params[:name])
    # If the user exists AND the password entered is correct.
    puts "user status: #{user.inspect}, user auth status: #{user.authenticate(params[:password]).inspect}"
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      puts session[:user_id]
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end