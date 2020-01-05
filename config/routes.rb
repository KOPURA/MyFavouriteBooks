Rails.application.routes.draw do
  resources :books

  root   to: redirect('/books')

  delete '/books', to: 'books#reset', as:'reset'
end
