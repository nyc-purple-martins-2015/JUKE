class UserMailer < ApplicationMailer
  default from: 'juke-team@jukejukejuke.com'

  def welcome_email(user)
    @user = user
    @url = 'example.com/login'
    mail(to: @user.email, subject: 'Welcome to Juke')
  end
end
