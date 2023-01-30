Rails.application.routes.draw do
  root 'rooms#index'

  resources :rooms, only: %i[index show create], param: :token do
    resources :messages, only: %i[create]
  end
end
