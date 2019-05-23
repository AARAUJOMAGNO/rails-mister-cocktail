Rails.application.routes.draw do
  get 'doses/description'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'cocktails#index'
  resources :doses, only: %i[destroy]
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[new create]
  end
end
