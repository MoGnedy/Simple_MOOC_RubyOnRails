Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "courses#index"
  resources :comments, except: :index
  post '/lectures/new/:course_id', to: 'lectures#new', as: 'course_new_lecture'
  get '/courses/user/:user', to: 'courses#get_my_courses', as: 'my_courses'
  get '/lectures/user/:user', to: 'courses#get_my_lectures', as: 'my_lectures'
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
