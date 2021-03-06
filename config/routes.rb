Rails.application.routes.draw do

  resources :delivery_configurations
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, param: :_id
  get '/auth', to: 'authentication#index'
  post '/auth/login', to: 'authentication#login'
  # get '/*a', to: 'application#not_found'

  get '*path', to: "application#fallback_index_html", constraints: ->(request) do
    !request.xhr? && request.format.html?
  end


end
