class Api::V1::UsersController < Api::BaseControllerController

  def index
    @users = User.all
    return render json: {succes: false, msg: 'No users'} unless @users.present?
  end

  def show
    @user = User.find_by_id(params[:id])
    return render json: {succes: false, msg: 'No user'} unless @user.present?
  end

end
