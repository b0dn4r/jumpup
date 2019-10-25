class HomesController < ApplicationController

  def show
  end

  def index
    @category = Category.find(params[:id])

  end

end
