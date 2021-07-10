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

  def destroy
    @user = current_user
    @band = @user.band
    @comment = Comment.find_by(params[:id])
    @article = @comment.article
    if @comment.destroy
      flash[:info] = "コメントを削除しました"
      redirect_to article_path(@article)
    else
      flash[:warning] = "コメントを削除出来ませんでした"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :article_id)
  end
end
