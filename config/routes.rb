Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#landing'
  get '/register', to:'users#new'
  resources :users, only: [:index, :show, :create]
end