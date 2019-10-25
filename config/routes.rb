Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: redirect("/#{I18n.default_locale}", status: 302), as: :redirected_root

  scope '/:locale', locale: /#{I18n.available_locales.join('|')}/ do
  root 'homes#show'
  # get 'comments/:post_url', to: 'comments#create'
  get '/:id' => 'homes#index', as: 'show_posts'
  # get 'posts/:id' => 'posts#show', as: 'show_post'
  get 'posts/:url' => 'posts#show', as: 'show_post'

  resources :posts do
    resources :comments
  end

  devise_for :users

  post 'comments/:post_url' => 'comments#create', as: 'comments'

  # post "api/v1/posts", to: "api/v1/posts#index"
end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      post 'posts', to: 'posts#index'
      post 'posts/:id', to: 'posts#show'
      post 'post_create' => 'posts#create'
      post 'post/:id/update', to: 'posts#update'

      post 'categories', to: 'categories#index'
      post 'categories/:id', to: 'categories#show'

      post 'comments', to: 'comments#index'
      post 'comments/:id', to: 'comments#show'
      post 'post/:id/comment', to: 'comments#create'
      post 'post/:post_id/comments/:id/update', to: 'comments#update'
      post 'comments/:id/mod', to: 'comments#mod'
      post 'comments/:id/unmod', to: 'comments#unmod'
      post 'comments/:id/delete', to: 'comments#destroy'

      post 'post_images', to: 'post_images#index'
      post 'post_images/:id', to: 'post_images#show'

      post 'users', to: 'users#index'
      post 'users/:id', to: 'users#show'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
