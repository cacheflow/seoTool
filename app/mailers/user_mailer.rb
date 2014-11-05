class UserMailer < ActionMailer::Base
  default from: "q.babin@gmail.com"

  def welcome_email(user, linkscape, toppages, anchorlinks,top)
  	@user = user
  	@linkscape = linkscape
  	@toppages = toppages
    @anchorlinks = anchorlinks
    @top = top
  	@url = 'fake.com/login'
  	mail(to: @user.email, subject: 'Welcome Lex to my Awesome Site')
  end
end
