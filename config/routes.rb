Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'

  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'
  devise_for :users

  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'cars#home'

  get 'finance.php' => redirect('cars/financing/bussiness')
  get 'finance-form.php', controller: :cars, action: :finance_ash_car

  resources :cars do
    collection do
      get :search
      post :search
      get :nieuw_binnen
      get 'financing/:type', to: :financing, as: :financing
      get :voorraad, action: :index
      get 'finance_ash_car/:car/:type', to: 'cars#finance_ash_car'
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

  resources :models do
    resource :cars do
      get :index, to: 'cars#model'
    end
  end

  resource :faqs do
    get :index
  end

  resource :wizard do
    post :pick_a_car
    get :pick_a_car
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

  resources :action_pages, path: :action, only: [:show]

  resources :blog_pages, as: :blog, only: [:show]

  resources :references, only: [:index, :create]

  namespace :admin do
    resource :admin do
      get :home
    end

    resources :action_pages

    resources :cars, only: [:index, :destroy]
    resources :static_texts do
      collection do
        put :update_multiple
      end
    end
    resources :faqs
    resources :pages
    resources :blog_pages do
      collection do
        get 'new/:template', action: :new, as: :new_with_template
        get 'edit/:id/:template', action: :edit, as: :edit_with_template
      end
    end

    resources :top_reviews

    resources :brands

    resources :banners, path: :banner do
      post :update_row_order, on: :collection
    end

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

    resources :car_requests, only: [:index, :show, :destroy] do
      get :show_bussiness
      delete :destroy_bussiness
    end

    root 'static_texts#index'
  end

  post '/import', to: 'import#handle'

end
