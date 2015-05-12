Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/railsadmin', as: 'rails_admin'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'cars#home'

  resources :cars do
    get :home
  end

  resource :brand do
    get :models
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
