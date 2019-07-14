Rails.application.routes.draw do
  root 'histories#index'
  devise_for :users

  namespace 'api' do
    namespace 'v1' do
      resources :purchases
      resources :products do
        collection do
          get 'search'
        end
      end
      resources :users, param: :username
      get '/:username/history', to: 'users#history'
      post '/auth/login', to: 'authentication#login'
      get '/*a', to: 'application#not_found'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
