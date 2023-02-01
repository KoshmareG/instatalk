Rails.application.routes.draw do
  devise_for :users

  root 'rooms#index'

  resources :rooms, only: %i[index show create destroy], param: :token do
    resources :messages, only: %i[create]
  end
end
