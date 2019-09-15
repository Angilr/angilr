# frozen_string_literal: true

Rails.application.routes.draw do
  root 'general#top'

  devise_for :users

  get :profile, to: 'users/settings#profile'
end
