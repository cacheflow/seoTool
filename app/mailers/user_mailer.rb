class UserMailer < ActionMailer::Base
  default from: "l.alexander10@gmail.com"

  def welcome_email(user, url)
  	@user = user
  	@url = request.original_url 	 
  	mail(to: @user.email, subject: 'Welcome Lex to my Awesome Site')
  end
end
