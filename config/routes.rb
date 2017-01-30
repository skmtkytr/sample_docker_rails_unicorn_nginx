Rails.application.routes.draw do
  devise_for :user,
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout'},
             controllers: { :omniauth_callbacks => "omniauth_callbacks" }

  get 'pages/show'
  get 'application/home'
  root 'pages#index'
  # devise_for controllers: { :omniauth_callbacks => "omniauth_callbacks" } , skip: [:sessions]
  # as :user do
  #   get 'login' => 'devise/sessions#new', as: :new_user_session
  #   post 'login' => 'devise/sessions#create', as: :user_session
  #   delete 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  #   get 'signup' => 'devise_invitable/registrations#new', as: :new_user_registration
  #   post 'signup' => 'devise_invitable/registrations#create', as: :user_registration
  #   get 'signup/cancel' => 'devise_invitable/registrations#cancel', as: :cancel_user_registration
  #   get 'user' => 'devise_invitable/registrations#edit', as: :edit_user_registration
  #   patch 'user' => 'devise_invitable/registrations#update', as: nil
  #   put 'user' => 'devise_invitable/registrations#update', as: :update_user_registration
  #   delete 'user' => 'devise_invitable/registrations#destroy', as: :destroy_user_registration
  #   get 'password' => 'devise/passwords#new', as: :new_user_password
  #   post 'password' => 'devise/passwords#create', as: :user_password
  #   get 'password/edit' => 'devise/passwords#edit', as: :edit_user_password
  #   patch 'password' => 'devise/passwords#update'
  #   put 'password' => 'devise/passwords#update', as: :update_user_password
  #
  # end
  # resources :users


end
