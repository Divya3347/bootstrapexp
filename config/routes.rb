Rails.application.routes.draw do
  root 'books#index'
  resources :books do
    member do
      delete "/delete_avatar/:avatar_id" , to: "books#delete_avatar" , as: "delete_image"
    end
  end
end
