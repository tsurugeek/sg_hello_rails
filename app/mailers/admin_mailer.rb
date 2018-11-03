class AdminMailer < ApplicationMailer
  default from: 'notifications@example.com', to: 'admin@example.com'

  def create_comment_email
    @comment = params[:comment]
    mail(subject: '新しいコメントが投稿されました')
  end
end
