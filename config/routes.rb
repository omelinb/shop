Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get    'products',         to: 'products#index'
    post   'cart',             to: 'carts#add'
    get    'cart',             to: 'carts#show'
    delete 'cart/:product_id', to: 'carts#remove'
  end
end
