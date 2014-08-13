class SessionsController < ApplicationController

	def new
	end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	def create
		email = params[:session][:email].downcase
		if email =~ VALID_EMAIL_REGEX
				user = User.find_by(email: params[:session][:email].downcase)
				flag = "email"

		else
				user = User.find_by(name: params[:session][:email].downcase)
		end

		if user && user.authenticate(params[:session][:password])
			# Sign in user in and redirect to the user's page
			sign_in user
			redirect_back_or root_path
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end
end
