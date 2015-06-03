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
      get :voorraad, action: :index
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

  resources :pages, only: [:show] do
    collection do
      get :contact
      get :sitemap
    end
  end

  resources :blog_pages do
    collection do
      get :auto_blog
      get :auto_lease_mogelijkheden
      get :auto_op_afbetaling
      get :full_operational_lease
      get :lease_gebruikte_autos
      get :opel_eyetracking
      get :our_workspace
      get :voordelen_financial_lease
    end
  end

  resources :blog_pages, as: :blog, only: [:show]

  resources :references, only: [:index, :create]

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

    resources :references, only: [:index, :destroy] do
      collection do
        get '/approve/:id', action: :approve, as: :approve
        get '/disapprove/:id', action: :disapprove, as: :disapprove
      end
    end

    resources :menu_items do
      collection do
        put :update_all
      end
    end

    resources :cms_fields, only: [:index, :update]

    resources :car_requests, only: [:index, :show, :destroy]

    root 'cars#index'
  end

  post '/import', to: 'import#handle'

end
