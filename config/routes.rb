Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'movies#home'
  get 'about', to: 'movies#about'
  # Movie list actions
  post 'lists', to: 'lists#create'
  get 'lists/:id/edit', to: 'lists#edit'
  resources :lists do
    resources :bookmarks, only: [:create, :destroy]
  end
end
