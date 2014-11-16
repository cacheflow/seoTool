class SeoMailer < ActionMailer::Base
  default from: "workemailex@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.seo_mailer.seo_analysis.subject
  #
  def seo_analysis(user)
    @user = user 
    # current_site = user.find_by()
    attachments.inline['eclogo.png'] = File.read('app/assets/images/ec-logo.png')
    mail to: user.email, subject: "SEO Results"


  end
end
