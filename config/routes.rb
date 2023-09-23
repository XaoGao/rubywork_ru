Rails.application.routes.draw do
  devise_for :users

  root "pages#welcome"
  resources :resumes
  resources :vacancies
end
