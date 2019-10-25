class PostsController < ApplicationController
  def show
    @post = Post.where(url: params[:url]).first
    @comment = Comment.new
    @user = current_user
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end
end
