Rails.application.routes.draw do
  devise_for :users

  as :user do
    get     "/signin",  to: "devise/sessions#new"
    get     "/signup",  to: "devise/registrations#new"
    delete  "/signout", to: "devise/sessions#destroy"
  end

  root "static_pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
