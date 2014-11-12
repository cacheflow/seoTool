require 'test_helper'

class SeoMailerTest < ActionMailer::TestCase
  test "seo_analysis" do
    mail = SeoMailer.seo_analysis
    assert_equal "Seo analysis", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
