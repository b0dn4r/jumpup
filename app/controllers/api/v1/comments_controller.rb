class Api::V1::CommentsController < Api::BaseControllerController

  def index
    @comments = Comment.all
    return render json: {succes: false, msg: 'No comments'} unless @comments.present?
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    return render json: {succes: false, msg: 'No comment'} unless @comment.present?
  end

  def create
    # if(current_user.present?)
    #
    #   @post = Post.find_by_id(comment_params[:post_id])
    #
    #   if(@post.comments.where(user_id: params[:user]).present?)
    #     return render json: {success: false, msg: "User has already left a comment"}
    #   end
    #
    #   @comment = current_user.comments.new(comment_params)
    #   if @comment.save
    #     return render json: {success: true, msg: 'Comment created'}
    #   else
    #     return render json: {succcess: false, msg: 'Fail to create comment', errors: @comment.errors}
    #   end
    # else
    #   return render json: {success: false, msg: "No user found"}
    # end

    return render json: {success: false, msg: "No user found"} unless current_user.present?

    @post = Post.find_by_id(params[:id])
    return render json: {success: false, msg: "No @post", errors: @post.errors} unless @post.present?

    # if(@post.comments.where(user_id: params[:user]).present?)
    #   return render json: {success: false, msg: "User has already left a comment"}
    # end

    @comment = current_user.comments.new(comment_params.merge(post_id: @post.id))
    return render json: {succcess: false, msg: 'Fail to create comment', errors: @comment.errors} unless @comment.save
    render json: {success: true, msg: 'Comment created'}
  end

  def update
    return render json: {success: false, msg: "No user found"} unless current_user.present?
    return render json: {success: false, msg: "User doesn`t have this comment`"} unless current_user.comments.where(id: params[:id]).present?

    @post = Post.find_by_id(params[:post_id])
    return render json: {success: false, msg: "No post", errors: @post.errors} unless @post.present?
    @comment = @post.comments.find_by_id(params[:id])
    # return render json: {success: false, errors: @comment.errors}

    if @comment.update(comment_params)
      return render json: {success: true, msg: "Comment has been successfully updated"}
    else
      return render json: {success: false, msg: "Failed to update", errors: @comment.errors}
    end
  end

  def mod
    @comment = Comment.find_by_id(params[:id])
    return render json: {success: false, msg: "Comment not found"} unless @comment.present?

    if @comment.update_column(:moderated, true)
      return render json: {success: true, msg: "Comment moderated"}
    else
      return render json: {success: false, msg: "Fail to moderate"}
    end
  end

  def unmod
    @comment = Comment.find_by_id(params[:id])
    return render json: {success: false, msg: "Comment not found"} unless @comment.present?

    if @comment.update_column(:moderated, false)
      return render json: {success: true, msg: "Comment unmoderated"}
    else
      return render json: {success: false, msg: "Fail to unmoderate"}
    end
  end

  def destroy
    return render json: {success: false, msg: "No user found"} unless current_user.present?
    @comment = current_user.comments.find_by_id(params[:id])
    return render json: {success: false, msg: "User doesn`t have this comment`"} unless @comment.present?

    return render json: {success: false, msg: "Failed to delete comment", errors: @comment.errors} unless @comment.destroy
    render json: {success: true, msg: "Comment deleted"}
  end

  private
  def comment_params
    params.require(:comment).permit(:body,  comment_tags_attributes: [:name])
  end

end
