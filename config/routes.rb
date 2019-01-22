Rails.application.routes.draw do
  root 'tops#top'
  resources :users, only:[:update, :show, :edit, :destroy]
  get     'sign_in',             to: 'users#session_new',          as: 'sign_in'
  post    'sign_in',             to: 'users#session_create'
  get     'sign_up',             to: 'users#new',                  as: 'sign_up'
  post    'sign_up',             to: 'users#create'
  delete  'sign_out',            to: 'users#session_destroy',      as: 'sign_out'

  resources :live_houses, only:[:index, :show, :new, :create, :destroy]
  get     '/:id/edit_basic',     to: 'live_houses#edit_basic',     as: 'edit_basic'
  patch   '/:id/update_basic',   to: 'live_houses#update_basic',   as: 'update_basic'
  put     '/:id/update_basic',   to: 'live_houses#update_basic'
  get     '/:id/edit_detail',    to: 'live_houses#edit_detail',    as: 'edit_detail'
  patch   '/:id/update_detail',  to: 'live_houses#update_detail',  as: 'update_detail'
  put     '/:id/update_detail',  to: 'live_houses#update_detail'

  get     'reports',             to: 'reports#index',              as: 'reports_index'
  post    'live_houses/:id/report',         to: 'reports#create',             as: 'reports'
  delete  'report/:id',          to: 'reports#destroy',            as: 'report_destroy'
end
