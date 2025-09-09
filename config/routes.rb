Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    get 'delete', on: :member
  end
end
