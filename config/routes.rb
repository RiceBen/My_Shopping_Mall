Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show]
  
  resource :car, only: [:show, :destroy] do
    collection do
      post :add, path:'add/:id'
      get :checkout
    end
  end
  
  resources :orders, only: [:create] do
    member do
      delete :cancel
    end
  end

  root "products#index"
end
