Rails.application.routes.draw do
  root to: "trip#index"
  get "street" => "trip#street"
  get "result" => "trip#result"
end
