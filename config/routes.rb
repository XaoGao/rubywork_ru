Rails.application.routes.draw do
  devise_for :users

  root "pages#welcome"
  resources :resumes
  resources :vacancies do
    get :my_vacancies, on: :collection
  end
end
