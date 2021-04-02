# frozen_string_literal: true

Rails.application.routes.draw do
  # get '/items', to: 'items#index'
  # post '/items', to: 'items#create'
    # only: %i[index create] 
  resources :items do
    get :upvote, on: :member # member is id in URL params к единственному объекту из коллекции ИТЕМ
    get :expensive, on: :collection
  end
end