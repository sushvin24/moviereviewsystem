Rails.application.routes.draw do


  root "movies#index"
  resources :movies do
    resources :ratings
    resources :reviews
  end
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
