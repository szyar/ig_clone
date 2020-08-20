class PostMailer < ApplicationMailer

  def post_confirm_mail(user)
    @user = user
    mail to: "@user.email", subject: "Post confirming"
  end

end
