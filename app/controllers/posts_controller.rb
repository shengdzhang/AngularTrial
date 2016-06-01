class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :upvote]

  def index
    @post = Post.all
    render json: @post
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      render json: @post
    end
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def upvote
    @post = Post.find(params[:id])
    @post.increment!(:upvotes)

    render json: @post
  end

  private
  def post_params
    params.require(:post).permit(:link, :title)
  end
end
