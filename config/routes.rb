Rails.application.routes.draw do



  devise_for :users
  root to: "home#index"

  resources :teams do

  end
  resources :customers do

  end
  resources :coordinators do

  end
  resources :runners do

  end
  resources :tracker do

  end

end
