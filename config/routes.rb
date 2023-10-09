Rails.application.routes.draw do
  # get '/new' => 'books#new'
  # post '/books' => 'books#create'
  # get '/books' => 'books#index'
  # get '/books/:id' => 'books#show', as: 'detail'
  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  # patch 'books/:id' => 'books#update', as: 'update_book'
  # delete 'books/:id' => 'books#destry', as: 'destroy_book'
  root to: 'books#top'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
