class ContactMailer < ApplicationMailer
  def contact_mail(blog,user)
    @blog = blog
    @user = user
    mail to: @user.email , subject: "duxi投稿確認メール"
  end
end
