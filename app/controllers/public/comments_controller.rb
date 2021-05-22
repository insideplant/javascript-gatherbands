class Public::CommentsController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    @comment.band_id = article.band_id
    if @comment.save
      flash[:success] = "コメントしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "コメントできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
