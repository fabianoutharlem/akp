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
      post :search
      get :nieuw_binnen
      get 'financing/:type', to: :financing, as: :financing
    end
  end

  resources :brands do
    collection do
      post :models
    end
    resource :cars do
      get :index, to: 'cars#brand'
    end
  end

  resource :faqs do
    get :index
  end

  resource :wizard do
    post :pick_a_car
    post :your_details
    post :final
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
    resources :blog_pages

    resources :brands

    root 'admin#home'
  end

  post '/import', to: 'import#handle'

end
