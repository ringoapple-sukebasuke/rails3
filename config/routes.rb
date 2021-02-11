Rails.application.routes.draw do
  get '/' => "home#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "login", to: "users#login_form"
  post "login", to: "users#login"
  post "logout", to: "users#logout"

  post "rooms/:id/reservations/confirm" => "reservations#confirm"
  
  resources :users
  resources :rooms
  resources :reservations

end
