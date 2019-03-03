Rails.application.routes.draw do
  get 'home/index'
  get 'reviews/new'
  get 'users/new'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login' =>  'sessions#new'
  post  'login' =>  'sessions#create'
  delete  'logut' =>  'sessions#destroy'

  resources :users do
    resources :reviews do
      collection do
        post 'search'
      end
    end
  end
end
