Rails.application.routes.draw do
  root to: "trip#index"
  get "street" => "trip#street"
end
