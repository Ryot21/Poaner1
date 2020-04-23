class CommentsController < ApplicationController

  before_action :correct_user, only: :create
  before_action :correct_user,   only: :destroy

  def create 
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'コメントしました'
      redirect_to @comment.post
    else
      flash[:danger] = 'コメント出来ません'
      redirect_to @comment.post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:danger] = 'コメントを削除しました'
    redirect_to @comment.post
  end


  private
  def comment_params
    params.require(:comment).permit(:content, :image)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_url if @comment.nil?
  end

end
