Rails.application.routes.draw do
  
  # devise_scope :user do
  #   get "register" => "devise/registrations#new", as: "new_user_registration"
  # end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  },
  path: ''

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
    get ':user/edit-profile' => 'devise/registrations#edit', :as => :edit_user_profile
    get 'sign_out', to: 'users/sessions#destroy'
  end

  root 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities
  resources :users
  


  # get 'signed-out', to: 'signouts#index'
  

  get 'user-profile', to: 'users#profile'
  
end
