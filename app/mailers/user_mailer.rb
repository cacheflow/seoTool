class UserMailer < ActionMailer::Base
  default from: "q.babin@gmail.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: 'Welcome Lex to my Awesome Site')
  end
end
