class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      puts "User " + user.inspect
      puts "errors while trying to create user: " + user.errors.full_messages.to_s
      redirect_to '/signup', flash: { error: user.errors.full_messages.first }
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
