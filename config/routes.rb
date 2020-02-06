Rails.application.routes.draw do

  root to: 'application#info'
  post 'login', to: 'auth#login'
  resources :ads

end
