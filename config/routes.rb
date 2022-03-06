Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'weather#show'

      get '/backgrounds', to: 'images#show'

      post '/users', to: 'users#create'
    end
  end
end
