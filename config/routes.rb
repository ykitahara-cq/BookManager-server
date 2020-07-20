Rails.application.routes.draw do
  namespace :api, formant: 'json' do
    namespace :v1 do
      post '/login', to: 'users#login'
      post '/sign_up', to: 'users#signup'
      resources :books, only: %i(index show create update)
    end
  end
end
