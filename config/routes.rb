Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "application#landing"
  post "/validate_user", to: "application#validate_user", as: "validate_user"
  resources :users do
  	resources :products do
  		resources :bids, only: [:create]
  	end
  end
end
