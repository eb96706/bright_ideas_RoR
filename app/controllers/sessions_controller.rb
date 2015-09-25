class SessionsController < ApplicationController

	def create # Login
		user = User.find_by(email: session_params[:email]) # Does the email exist in the database?
		if user
			if user.authenticate(session_params[:password]) # Email exists! Now compare it with password...
				session[:user_id] = user.id # Password is correct! Now store user's id in session variable...
				redirect_to '/posts'
			else
				flash[:error] = 'Invalid Email/Password Combination' #bad password
				redirect_to '/'
			end
		else
			flash[:error] = 'Invalid Email/Password Combination' #bad email
			redirect_to '/'
		end
	end

	def destroy # Logout
		session[:user_id] = nil
		redirect_to '/'
	end

	private

	def session_params
		params.require(:user).permit(:email, :password)
		
	end
end
