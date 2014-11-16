class UserMailer < ActionMailer::Base
  default from: "workemailex@gmail.com"

  def welcome_email(user)
  	# @url = request.original_url 	 
  	# attachments.inline["El Clasficiado"] = File.read("../assets/images/ec-logo.png")
  end

  

end
