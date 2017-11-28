Rails.application.routes.draw do
	get 'goods/index'
  get 'goods/week'
  get 'goods/threedays'
	
	resources :goods



	root 'goods#week'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
