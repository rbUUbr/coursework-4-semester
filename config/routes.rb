Rails.application.routes.draw do
  resources :users
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root 'application#index'

  get "*path.html" => "application#index", :layout => 0
  get "*path" => "application#index"

  resources :groups, only: [:index, :show]
  resources :schedules, only: [:create, :index, :show, :update]
  resources :favorites, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
