# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/items', to: 'items#index'
  # post '/items', to: 'items#create'
    # only: %i[index create] 
  get '/admin/users_count', to: 'admin#users_count'
  
  resources :items do
    get :upvote, on: :member # member is id in URL params к единственному объекту из коллекции ИТЕМ
    get :expensive, on: :collection
  end

  root to: 'items#index' #redir to main page
end