class Api::BaseControllerController < ApplicationController
  skip_before_action :verify_authenticity_token

  # before_action :current_user

  def current_user

    if(params[:user].present?)
      @user = User.find_by_id(params[:user])
      if @user.present?
        p "=============     #{@user}"
        @current_user ||= @user
      end
    end

    # if(params[:post].present?)
    #   @post = Post.find_by_id(params[:post])
    #   if(@post.present?)
    #     p "--------------post: #{@post.name}"
    #   end
    # end

    # return render json: {success: false, msg: "Wrong parameter"} unless @user.present?

    # current_user = @user
    #
    # p current_user.id.to_s

  end

end
