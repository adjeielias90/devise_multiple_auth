Rails.application.routes.draw do
  devise_for :radius_users
  root 'dashboard#index'

  devise_for :ldap_users, controllers: {
    sessions: 'ldap_users/sessions'
  }
  devise_scope :ldap_user do
    root to: 'ldap_users/sessions#new'
    get 'sign_in', to: 'ldap_users/sessions#new'
    get '/ldap_users/sign_out', to: 'ldap_users/sessions#destroy'
  end



  resources :general_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
