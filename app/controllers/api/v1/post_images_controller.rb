class Api::V1::PostImagesController < Api::BaseControllerController
  def index
    @post_images = PostImage.all
    return render json: {succes: false, msg: 'No images'} unless @post_images.present?
  end

  def show
    @post_image = PostImage.find_by_id(params[:id])
    return render json: {succes: false, msg: 'No image'} unless @post_image.present?
  end

end
