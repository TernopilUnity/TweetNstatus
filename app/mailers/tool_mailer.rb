class ToolMailer < ActionMailer::Base
  default from: "admin@rfz.com"

  def low_counts(tool, user)
    attachments["Tool.jpg"] = tool.picture_file
    mail to: user.email, subject: "#{tool.name} has low counts"
  end

  def broken
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
