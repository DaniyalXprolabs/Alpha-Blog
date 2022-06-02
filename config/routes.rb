Rails.application.routes.draw do
  root "articles#index"
  resources :articles
  resources :users, except:  [:new,:create]
  get "about", to:  "pages#about"
  get "signup/", to: "users#new"
  post "users/", to: 'users#create'
  get 'login/', to: 'sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
