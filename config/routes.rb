Rails.application.routes.draw do
  
  resources :planets, only: [:index]

  resources :missions, only: [:create]
  
  resources :scientists
  resources :scientists do
    resources :missions, only: [:index]
  end

end
