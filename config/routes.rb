Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"

  resources :teams do
    collection do
      put 'add-runners/:id' => 'teams#add_runners_to', as: :add_runners_to
      put 'remove-runner-from/:id/runner/:runner_id' => 'teams#remove_runner_from', as: :remove_runner_from
    end
  end

  resources :customers do

  end


  resources :coordinators do
    collection do
      post :import

    end
  end


  resources :runners do
    collection do
      post :import

    end
  end


  resources :tracker do

  end

end
