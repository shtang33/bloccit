app/mailers/favorite_mailer.rb

class FavoriteMailer < ApplicationMailer
  default from: "shuhaur.tang@gmail.com"

  def new_comment(user, post, comment)
  
    # New Headers
    headers["Message-ID"] = "<comments/#{comment.id}@stang-bloccit.example>"
    headers["In-Reply-To"] = "<post/#{post.id}@stang-bloccit.example>"     
    headers["References"] = "<post/#{post.id}@stang-bloccit.example>"

    @user = user
    @post = post
    @comment = comment

    mail(to: user.email, subject: "New comment on #{post.title}")
  end

end
