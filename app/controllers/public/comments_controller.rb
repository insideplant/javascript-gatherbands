class Public::CommentsController < ApplicationController
  def create
    @user = current_user
    @band = @user.band
    @comment = @band.comments.new(comment_params)
    @article = @comment.article
    if @comment.save
      @article.create_notification_comment!(@band, @comment.id)
      flash[:info] = "コメントしました"
      redirect_to article_path(@article)
    else
      flash[:warning] = "コメントできませんでした"
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
