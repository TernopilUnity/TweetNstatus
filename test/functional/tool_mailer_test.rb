require 'test_helper'

class ToolMailerTest < ActionMailer::TestCase
  test "low_counts" do
    mail = ToolMailer.low_counts
    assert_equal "Low counts", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "broken" do
    mail = ToolMailer.broken
    assert_equal "Broken", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
