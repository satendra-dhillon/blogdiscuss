Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
 #  match "/auth/:provider/callback" => "sessions#create", via: [:get, :post]
	# match "/signout" => "sessions#destroy", via: [:get, :post], :as => :signout
	devise_scope :user do
		match 'auth/:provider/callback', to: 'sessions#create', as: 'signin', via: :get
	  get 'auth/failure', to: redirect('/')
	  delete 'signout', to: 'sessions#destroy', as: 'signout'
	end

	resources :blogs do
		resources :comments
	end
	
	resources :comments do
	    resources :comments
	end
end


