Rails.application.routes.draw do
  root "home#index"
  get '/forex' => "forex#exchange"
end
