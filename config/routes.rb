# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get 'donations/donate'

  get 'guidelines', to: 'welcome#guidelines'
  get 'privacy', to: 'welcome#privacy'
  get 'terms', to: 'welcome#terms'

  get 'search_services', to: 'welcome#start_search'

  resources :postings
  resources :services
end
