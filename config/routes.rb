Rails.application.routes.draw do
  #get 'top' => 'homes#top'
  root to: 'homes#top'
  get 'books' => 'books#index'
  get 'books/edit'
  get 'books/show'
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
