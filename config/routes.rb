Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/posts', to: "api#posts"
  get '/site_dive/:id', to: "api#site_dive"
end
