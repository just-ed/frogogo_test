Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  namespace :api do
    namespace :v1 do
      resources :users
      post '/auth/login', to: 'authentication#login'
    end
  end
end
