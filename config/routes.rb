Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :movies, only: [ :index ]
  root to: 'lists#index'
  resources :lists, only: [ :show, :new, :create ] do
    resources :bookmarks, only: [ :create, :destroy ]
  end

end
