class PostsController < ApplicationController
  before_action :ensure_logged_in, except: [:show]

  def new
    @post = Post.new
    @post.sub_id = params[:sub_id]
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.sub_id = params[:sub_id]
    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    @post.update(post_params)
    flash[:errors] = @post.errors.full_messages
    redirect_to post_url(@post)
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to sub_url(@post.sub.id)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end

end
