Rails.application.routes.draw do
  devise_for :users
  root to: "courses#index"
  resources :comments
  post '/lectures/new/:course_id', to: 'lectures#new', as: 'newlecture'
  resources :lectures
  resources :courses
  resources :roles
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
