Rails.application.routes.draw do

  root to: 'application#info'

  devise_for(
    :users, 
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
  )

  resources :ads

end
