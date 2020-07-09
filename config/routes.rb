Rails.application.routes.draw do
  namespace :api, formant: 'json' do
    namespace :v1 do
      post '/login', to: 'user#login'
      post '/sign_up', to: 'user#signup'
      resource :books, only: %i(index create update destroy)
    end
  end
end
