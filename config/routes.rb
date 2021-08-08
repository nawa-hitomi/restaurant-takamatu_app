Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'registrations' }
get "users/show" => "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

get "lists/show" => "lists#show"
root to: "home#index"
end
