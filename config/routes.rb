Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :products, only: [:index]
  end
end
