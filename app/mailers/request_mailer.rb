class RequestMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome_email
    @email = params[:email]
    @name = params[:name]
    mail(to: @email, subject: 'Account request recieved')
  end
end
