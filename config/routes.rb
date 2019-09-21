# frozen_string_literal: true

Rails.application.routes.draw do
  root 'general#top'

  devise_for :users
  devise_for :admins, path: 'admin'

  get :profile, to: 'users/settings#profile'

  namespace :admin do
    root 'general#dashboard'
  end
end
