Rails.application.routes.draw do
  root "welcome#index"
  resources :searchs, only: [:index]
end
