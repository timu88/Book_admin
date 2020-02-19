Rails.application.routes.draw do
  get 'profile/show'
  get 'profile/edit'
  get 'profile/update'
  get "/books/:id" => "books#show"
  
  resource :profile, only: %i[show edit update]

    
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
