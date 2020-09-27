Rails.application.routes.draw do
  resources :ideas, only: [:show]
end
