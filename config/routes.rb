Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "pages#home", as: "root"
  get "/textbooks", to: "textbooks#index", as: "textbooks"
  post "/textbooks", to: "textbooks#create"
  get "/textbooks/new", to: "textbooks#new", as: "new_textbook"
  get "/textbooks/:id", to: "textbooks#show", as: "textbook"
  patch "/textbooks/:id", to: "textbooks#update"
  get "/textbooks/:id/edit", to: "textbooks#edit", as: "edit_textbook"
  delete "/textbooks/:id", to "textbooks#destroy", as: "delete_textbook"

  get "/subjects/:id", to: "subjects#show", as: "subject"

end
