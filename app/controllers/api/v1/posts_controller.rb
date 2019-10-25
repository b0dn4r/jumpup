class Api::V1::PostsController < Api::BaseControllerController

  def index

    # p "current_user: ======= #{ current_user }"

    @posts = Post.all

    return render json: {success: false, msg: "No posts"} unless @posts.present?

    # if !@posts.present?
    #   render json: {success: false, msg: "No posts"}
    # end


    # render json: { posts: @posts  }
    # render json: { posts: @posts.as_json(only: [:name]) }
    # render json: { posts: @posts.as_json(only: [:name], include: {comments: {only: [:body]}}) }
  end

  def show
    @post = Post.find_by_id(params[:id])
    return render json: {success: false, msg: "No post"} unless @post.present?
  end

  def create
      @user = current_user
      if(@user.present?)
        @post = Post.new(post_params)
        if @post.save
          # p "+++++++++++++++ new post added #{@post}"
          return render json: {success: true, msg: "YES"}
        else
          return render json: {success: false, msg: "No post", errors: @post.errors }
          # p "----------------------- failed to add post"
        end
      end
  end

  def update
    @post = Post.find_by_id(params[:id])
    return render json: {success: false, errors: @post.errors} unless @post.present?

    if @post.update(params[:post].permit(:body))
      return render json: {success: true, msg: "Post has been successfully updated"}
    else
      return render json: {success: false, msg: "Failed to update", errors: @post.errors}
    end
  end


  private
  def post_params
    params.require(:post).permit(:name, :body, :category_id)
  end

end
