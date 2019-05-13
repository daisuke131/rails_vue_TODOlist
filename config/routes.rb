Rails.application.routes.draw do
  root 'home#index'
  namespace :api, { format: "json" } do
    namespace :v1 do
      resources :todos, :only => [:index, :create, :update, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
