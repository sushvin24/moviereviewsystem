class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@rubyreview.com"
  layout "mailer"
end
