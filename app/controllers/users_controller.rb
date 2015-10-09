class UsersController < ApplicationController
  def index
  end

  def create
  	new_user = User.create(user_params)
  	if new_user.valid?
  		flash[:notice] = 'You successfully registred'
  		redirect_to '/'
  	else
  		flash[:errors] = new_user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/'
  end

  def show
  	@user = User.find(params[:id])
  end

  private
  def user_params
  		params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end

end
