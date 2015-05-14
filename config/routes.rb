Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'cars#home'

  resources :cars do
    collection do
      get :search
    end
  end

  resources :brand do
    collection do
      get :models
    end
    resource :cars do
      get :index, to: 'cars#brand'
    end
  end

  resource :faqs do
    get :index
  end


  namespace :admin do
    resource :admin do
      get :home
    end

    resources :cars
    resources :static_texts do
      collection do
        put :update_multiple
      end
    end
    resources :faqs
    resources :pages

    root 'admin#home'
  end

  post '/import', to: 'import#handle'

end
