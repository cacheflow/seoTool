class SeoMailer < ActionMailer::Base
  default from: "workemailex@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seo_mailer.seo_analysis.subject
  #
  def seo_analysis(user)
    @user = User 
    # current_site = user.find_by()
    mail to: user.email, subject: "Here are your site results."
  end
end
