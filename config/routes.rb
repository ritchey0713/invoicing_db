Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'users#landing_page'

  get "errors", :to => "users#errors_page"

  get "users/:id", :to => "users#show", :as => "user_show"

  resources :categories, only: [:index, :new, :create, :edit, :update, :show, :destroy]  
    

  resources :companies, only: [:index, :new, :create, :edit, :update, :show, :destroy] do 
    resources :jobs, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end 
  
end
