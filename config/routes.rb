Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'lab_queues#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :users do
    get 'my_queues', to: 'selected_queues#index'
  end
  get '/search/:subject', to: 'lab_queues#search'
  resources :groups, only: [:index, :show]
  resources :schedules, only: [:create, :index, :show, :update]

  resources :lab_queues do
    get 'registrate_on_lab', to: 'selected_queues#registrate_on_lab'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
