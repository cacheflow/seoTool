# Preview all emails at http://localhost:3000/rails/mailers/seo_mailer
class SeoMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/seo_mailer/seo_analysis
  def seo_analysis
    SeoMailer.seo_analysis
  end

end
