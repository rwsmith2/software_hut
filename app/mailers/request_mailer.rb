class RequestMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def welcome_email
    @email = params[:email]
    @name = params[:name]
    mail(to: @email, subject: 'Account request recieved')
  end

  def accepted_email
    @email = params[:email]
    @name = params[:name]
    @password = params[:password]
    mail(to: @email, subject: 'Account request accepted')
  end

  def rejected_email
    @email = params[:email]
    @name = params[:name]
    mail(to: @email, subject: 'Account request rejected')
  end
end
