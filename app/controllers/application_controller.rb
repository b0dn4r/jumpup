class ApplicationController < ActionController::Base
  before_action :all_categories, :all_posts, :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def all_categories
    @all_categories = Category.all
  end

  def all_posts
    @all_posts = Post.all
  end

end
