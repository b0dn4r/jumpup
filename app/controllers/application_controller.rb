class ApplicationController < ActionController::Base
  before_action :all_categories, :all_posts

  def all_categories
    @all_categories = Category.all
  end

  def all_posts
    @all_posts = Post.all
  end
end
