Rails.application.routes.draw do
  root to: "application#angular"
  resources :groups, only: [:index, :show]
  resources :schedules, only: [:create, :index, :show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
