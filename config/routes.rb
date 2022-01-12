Rails.application.routes.draw do
  #get 'top' => 'homes#top'
  root to: 'homes#top',as: 'root'
  get 'books' => 'books#index',as: 'index'
  post 'books' => 'books#create',as: 'create_book'
  get 'books/:id' => 'books#show',as: 'show_book'
  get 'books/:id/edit' => 'books#edit',as: 'edit_book'
  patch 'books/:id' => 'books#update',as: 'update_book'
  delete 'books/:id' => 'books#destroy',as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
