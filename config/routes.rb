Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  #resource :auths, only: [:create]
  resources :kinds

  resources :contacts do 
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'
    
    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'
    
    resource :phone, only: [:show]
    resource :phone, only: [:show], path: 'relationships/phone'

    resource :address, only: [:show,:update,:create,:destroy]
    resource :address, only: [:show,:update,:create,:destroy], path: 'relationships/address'
  end
  #get '/contacts', to: "contacts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
