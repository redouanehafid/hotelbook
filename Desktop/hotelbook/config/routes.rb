Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :skip => [:registrations] 
  as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :posts do
    resources :comments
  end

  authenticated :user do
  	root 'posts#index', as: "authenticated_root"
  end

  root 'pages#index'
  get 'contact' => 'posts#contact'
  get 'articles' => 'posts#articles'

end
