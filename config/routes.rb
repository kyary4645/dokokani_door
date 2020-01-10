Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: "trip#index"
  get "street" => "trip#street"
  get "result" => "trip#result"
end
