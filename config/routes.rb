Rails.application.routes.draw do

  root   'static_pages#home'

  
  get    '/introduction',    to: 'static_pages#introduction'
  get    '/tennis',   to: 'static_pages#tennis'
  get    '/contact', to: 'static_pages#contact'
  get    '/interview', to: 'static_pages#interview'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users
  resources :posts
end