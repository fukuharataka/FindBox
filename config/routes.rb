Rails.application.routes.draw do
  root 'tops#top'
  resources :users, only:[:update, :show, :edit, :destroy]
  get  'sign_in',  to: 'users#sign_in',       as: 'sign_in'
  post 'sign_in',  to: 'users#session_create'
  get  'sign_up',  to: 'users#new',           as: 'sign_up'
  post 'sign_up',  to: 'users#create'
end
