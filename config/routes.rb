#Rails.application.routes.draw do
  # resources :widgets
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
  #root 'welcome#index'
#end
Rails.application.routes.draw do 
	resources :contacts, only: [:new, :create]
	resources :visitors, only: [:new, :create]
	get 'set_language/english'
	get 'set_language/italian'
	root to: 'visitors#new'
end
