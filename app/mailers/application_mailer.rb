# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'admin@railsevents.com'
  layout 'mailer'
end
