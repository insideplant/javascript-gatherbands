class UserMailer < ApplicationMailer
  default from: 'gather_bands0703@gmail.com'

  def welcome_email
    @user = params[:user]
    @url  = 'gather_bands0703@gmail.com'
    mail(to: @user.email, subject: 'Gather Bandsへようこそ')
  end
end
