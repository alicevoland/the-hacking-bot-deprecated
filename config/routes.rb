Rails.application.routes.draw do
  root 'welcome#index'
  get 'keep_alive', to: 'welcome#keep_alive'

  resources :users, only: %i[index show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
