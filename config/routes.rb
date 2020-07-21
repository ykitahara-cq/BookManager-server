Rails.application.routes.draw do
  namespace :api, formant: 'json' do
    namespace :v1 do
      post '/login', to: 'users#login'
      post '/sign_up', to: 'users#signup'
      delete '/logout', to: 'users#logout'
      resources :books, only: %i(index create update)
    end
  end
end
