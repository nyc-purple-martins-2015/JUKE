class UserMailer < ActionMailer::Base
  default from: 'jukeappteam@gmail.com'

  def welcome_email(user)
    @user = user
    @url = 'example.com/login'
    mail(to: @user.email, subject: 'Welcome to Juke')
  end

  def invite_email(email)
    mail(to:email, subject: "You've been invited to join a Juke!")
  end
end
