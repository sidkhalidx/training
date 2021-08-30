Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :profiles
  resources :patients do
    collection do
      get :abc
    end
    resources :doctors
  end
  resource :patient, only: [:show]
  concern :likes_concern do
    resources :likes
  end
  resources :articles, shallow: true do
    resources :comments
  end
  namespace :arts do
    resources :cmnts
  end
  resources :messages, concerns: :likes_concern
  get 'patients/about/', to: 'patients#about', as: 'patients_about'
  get 'people',to: 'people#index', as: 'people'
  get 'people/new', as: 'people_new'
  post 'people/crate', as: 'people_crate'
  get 'people/show', as: 'people_profile'
  get '/people/show/:id',to: 'people#specific', as: 'people_sp_profile'
  get '/people/:id/:name', to: 'people#edit', as: 'people_edit'
end