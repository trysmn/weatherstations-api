Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/api/weatherstations', to: 'weatherstations#index', as: :index

  post '/api/weatherstations', to: 'weatherstations#create', as: :create

  get '/api/weatherstations/:id', to: 'weatherstations#show', as: :show

  put '/api/weatherstations/:id', to: 'weatherstations#update', as: :update

  delete '/api/weatherstations/:id', to: 'weatherstations#destroy', as: :delete

  get '/api/weatherstations/:weatherstation_id/climatedatas', to: 'climatedatas#index', as: :climate_datas_index

  post '/api/weatherstations/:weatherstation_id/climatedatas', to: 'climatedatas#create', as: :climate_datas_create

  get '/api/weatherstations/:weatherstation_id/climatedatas/:id', to: 'climatedatas#show', as: :climate_datas_show

  put '/api/weatherstations/:weatherstation_id/climatedatas/:id', to: 'climatedatas#update', as: :climate_datas_update

  delete '/api/weatherstations/:weatherstation_id/climatedatas/:id', to: 'climatedatas#destroy', as: :climate_datas_delete
end
