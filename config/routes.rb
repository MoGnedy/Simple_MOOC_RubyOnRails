Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "courses#index"
  resources :comments, except: :index
  post '/lectures/new/:course_id', to: 'lectures#new', as: 'newlecture'
  resources :lectures do
  member do
    put "like", to: "lectures#upvote"
    put "dislike", to: "lectures#downvote"
  end
end
  resources :lectures, only: [:show, :edit, :update, :destroy]
  resources :courses
  resources :roles
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
