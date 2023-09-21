Rails.application.routes.draw do
  devise_for :users

  root "pages#welcome"
  resources :vacancies
end
