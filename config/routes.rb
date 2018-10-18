Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/weatherstations', to: 'weatherstations#index', as: :index

  post '/api/weatherstations', to: 'weatherstations#create', as: :create

  get '/api/weatherstations/:id', to: 'weatherstations#show', as: :show

  put '/api/weatherstations/:id', to: 'weatherstations#update', as: :update

  delete '/api/weatherstations/:id', to: 'weatherstations#destroy', as: :delete
end
