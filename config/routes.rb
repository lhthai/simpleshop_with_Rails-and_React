Rails.application.routes.draw do
  root 'pages#index'

  namespace :api do
    namespace :v1 do
      resources :products, param: :id
      resources :orders, param: :id
      resources :categories, param: :id
      resources :customers, param: :id
      resources :orderdetails, param: :id
    end
  end

  get '*path', to: 'pages#index', via: :all
end
