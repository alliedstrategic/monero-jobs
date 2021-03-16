# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "jobs@cryptojobs.com"
  layout "mailer"
end
