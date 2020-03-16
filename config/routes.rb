Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/team',    to: 'static_pages#team'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new'
  get  '/graph', to: 'waters#index'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get   '/waters', to: "waters#new"
  post   '/waters', to: 'waters#create'
  patch  '/waters', to: 'waters#create'
  resources :users
end