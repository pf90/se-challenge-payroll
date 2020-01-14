Rails.application.routes.draw do
  root 'reports#index'

  resources :reports, only: [:index, :new, :create, :show]

end
