Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :coordinates, only: [:index]
    end
  end
end
