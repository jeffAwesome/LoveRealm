LoveRealm::Application.routes.draw do
  get "users/show"
  resources :users

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  match '/profile/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
  root 'home#index'

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

end
