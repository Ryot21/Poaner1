class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  

  def create
    # binding.pry
    Post.create(post_params)
    redirect_to posts_path
  end

  def show
    @user = User.find_by(params[:id])
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments #コメント表示用投稿に関連づくコメントの取得
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id)
  end

end
