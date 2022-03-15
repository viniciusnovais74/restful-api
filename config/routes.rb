Rails.application.routes.draw do
  resources :kinds
  resources :contacts
  #get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
