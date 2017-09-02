Rails.application.routes.draw do
  devise_for :admins

  root to: "cars#index"
  resources :cars do
    resources :opinions
  end
  resources :reservations

  mount PostgresqlLoStreamer::Engine => "/car_image"

  #devise_for :admins# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
