class UserMailer < ActionMailer::Base
  default from: "avibenjohnson@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'fake.com/login'
  	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
