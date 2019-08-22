class UsersController < ApplicationController

  def new
  end

  def create
    puts user_params.inspect
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to :root
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :first_name, :last_name, :password, :password_confirmation)
  end

end
