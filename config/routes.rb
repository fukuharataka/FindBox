Rails.application.routes.draw do
  root 'tops#top'
  resources :users, only:[:update, :show, :edit, :destroy]
  get       'sign_in',            to: 'users#session_new',          as: 'sign_in'
  post      'sign_in',            to: 'users#session_create'
  get       'sign_up',            to: 'users#new',                  as: 'sign_up'
  post      'sign_up',            to: 'users#create'
  delete    'sign_out',           to: 'users#session_destroy',      as: 'sign_out'

  resources :live_houses, only:[:index, :show, :new, :create, :destroy] do
    get     'edit_basic',     to: 'live_houses#edit_basic',     as: 'edit_basic'
    patch   'update_basic',   to: 'live_houses#update_basic',   as: 'update_basic'
    put     'update_basic',   to: 'live_houses#update_basic'
    get     'edit_detail',    to: 'live_houses#edit_detail',    as: 'edit_detail'
    patch   'update_detail',  to: 'live_houses#update_detail',  as: 'update_detail'
    put     'update_detail',  to: 'live_houses#update_detail'
  end
end
