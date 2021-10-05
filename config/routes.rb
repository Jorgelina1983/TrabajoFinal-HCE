Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :doctors
  resources :patients
  resources :departments
  resources :appointments
  resources :import_export

  get 'import_export/export', to: 'import_export#export', as: 'export'
  get 'import_export/export/:id', to: 'import_export#export', as: 'export_patient'

  root "home#index"
end
