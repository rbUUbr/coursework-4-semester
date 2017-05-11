Rails.application.routes.draw do

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end
  resources :groups, only: [:index, :show]
  resources :schedules, only: [:create, :index, :show, :update]
  resources :favorites, only: [:index, :show, :create, :destroy]
  resources :lab_queues
    get 'registrate_on_lab', to: 'lab_queues#registrate_on_lab'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
