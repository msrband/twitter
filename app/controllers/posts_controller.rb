class PostsController < ApplicationController
  before_action :set_user
  before_action :set_post, only: [:destroy]

  def index
    @posts = @user.posts.order(created_at: :desc)
  end

  def create
    @post = Post.new(create_params)
    @post.user = @user

    if @post.save
      redirect_to posts_path
    else
      redirect_back fallback_location: root_path, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      redirect_back fallback_location: root_path, status: :unprocessable_entity
    end
  end

  private

  def create_params
    params.require(:post).permit(:body)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find_or_create_by(name: "Zoo")
  end
end
