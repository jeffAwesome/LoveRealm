LoveRealm::Application.routes.draw do
  get "users/index"
  resources :users
  devise_for :users
  root 'home#index'

  %w( 404 422 500 ).each do |code|
    get code, :to => "errors#show", :code => code
  end

end
