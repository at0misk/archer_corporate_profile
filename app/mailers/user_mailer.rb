class UserMailer < ApplicationMailer
  def create_and_deliver_password_change(user, random_password)
    @user = user
    @random_password = random_password
      mail(to: "#{@user.email}", subject: 'Archer Travel Corporate Profile - Password Recovery')
  end
end
