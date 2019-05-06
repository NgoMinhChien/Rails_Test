Rails.application.routes.draw do
  devise_for :users

  as :user do
    get      "/signin",      to: "devise/sessions#new"
    get      "/signup",      to: "devise/registrations#new"
    delete   "/signout",     to: "devise/sessions#destroy"
  end

  get        "/new_product", to: "products#new"
  root       "categories#index"
  get        "/home",        to: "static_pages#home"

  resources  :categories,     only: [:index, :show]
  resources  :products,       only: [:create, :index, :edit, :update, :show, :destroy]
  resources  :orders,         only: [:index, :edit, :update, :show, :destroy]
  resources  :order_details,  only: [:create, :edit, :update, :show, :destroy]
  resources  :transactions,   only: [:create]
  # For details on the DSL available within this file, 
  # see http://guides.rubyonrails.org/routing.html
end
