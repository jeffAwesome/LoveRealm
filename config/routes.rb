LoveRealm::Application.routes.draw do

  get "dashboard/index"
  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

  #get "users/show"
  #get '/patients/:id', to: 'users#show'
  #match 'show/:id' => 'users#show', via: [:get]
  #resources :users
  #match "/profile" => "users#show", :as => 'profile'
  #get "users/show", to: "users#show"
  #match '/love/' => 'profiles#show', via: [:get], :as => :profile
  #match '/profile/:id/' => 'profiles#show', via: [:get], :as => :profile
  #resources :users
  get 'profile/:id' => 'users#show', :as => :users

  get '/dashboard/', to: 'dashboard#index'

  authenticated :user do
    # Rails 4 users must specify the 'as' option to give it a unique name
    root :to => "dashboard#index", :as => "authenticated_root"
  end

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  root 'home#index'

end
