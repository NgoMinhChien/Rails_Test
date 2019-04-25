Rails.application.routes.draw do
  devise_for :users

  as :user do
    get      "/signin",  to: "devise/sessions#new"
    get      "/signup",  to: "devise/registrations#new"
    delete   "/signout", to: "devise/sessions#destroy"
  end

  root       "category#index"
  resources  :category,  only: [:index, :show]
  resources  :products,  only: [:edit, :update, :show, :destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
