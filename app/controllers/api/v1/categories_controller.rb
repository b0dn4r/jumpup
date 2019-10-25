class Api::V1::CategoriesController < Api::BaseControllerController

  def index
    @categories = Category.all
    return render json: {success: false, msg: "No categories"} unless @categories.present?
  end

  def show
    @category = Category.find_by_id(params[:id])
    return render json: {success: false, msg: "No category"} unless @category.present?
  end

  end
