Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :scaffolds
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: "home#index"
end
