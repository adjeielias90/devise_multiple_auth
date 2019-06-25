Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :ldap_users, controllers: {
    sessions: 'ldap_users/sessions'
  }


  devise_for :radius_users, controllers: {
    sessions: 'radius_users/sessions'
  }

  devise_scope :ldap_user do
    root to: 'ldap_users/sessions#new'
    get 'sign_in', to: 'ldap_users/sessions#new'
    get '/ldap_users/sign_out', to: 'ldap_users/sessions#destroy'
  end

  devise_scope :radius_user do
    root to: 'radius_users/sessions#new'
    get 'sign_in', to: 'radius_users/sessions#new'
    get '/radius_users/sign_out', to: 'radius_users/sessions#destroy'
  end




  resources :general_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
