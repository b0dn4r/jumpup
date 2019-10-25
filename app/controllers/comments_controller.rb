class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create

    @post = Post.where(url: params[:post_url]).first
    if @post.present?
      @comment = current_user.comments.create(comment_params.merge(post_id: @post.id))
      flash[:comment_add] = "Comment was added"
      redirect_to post_path(@post.url), notice: "Comment was added"
    else
      redirect_to root_url, alert: "No comment added"
    end

    # @comment = @post.comments.build(comment_params)
    # if(@comment.save)
    #   redirect_to post_path(@post)
    # else
    #   redirect_to root_url

  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post)
  # end

  private
  def comment_params
    params.require(:comment).permit(:body, :moderated)
  end
end
