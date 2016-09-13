class UserMailer < ApplicationMailer
  default from: 'jukeappteam@gmail.com'

  def invite_email(email, setlist)
    @setlist = setlist
    mail(to:email, subject: "You've been invited to join a Juke!")
  end

end

