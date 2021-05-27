class PostsController < ApplicationController
  before_action :set_post,only:[:destroy,:update]
  before_action :set_posts,only:[:index,:create,:confirm,:edit,:update]

  def index
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render :index
    else
      if @post.save
        redirect_to posts_path, notice:"つぶやいた・・・"
      else
        render :index
      end
    end
  end

  def confirm
    @post = Post.new(post_params)
    render :index if @post.invalid?
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集した・・・"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除ぉ"
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_posts
    @posts = Post.all
  end

end
