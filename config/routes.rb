#Rails.application.routes.draw do
  # resources :widgets

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  #root 'welcome#index'
#end
Rails.application.routes.draw do
	#root to: redirect("/about.html")
	root 'visitors#new'
end
