class UserMailer < ActionMailer::Base
  default from: "bhupeshkumar99@gmail.com"

  def welcome_email(user)
	  @user = user
	  @url = 'http://example.com/login'
	  mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

	def new_password(user)
			@user = user
			@url = 'http://example.com/login'
			mail(to: @user.email, subject: "Reset password")
	end
end
