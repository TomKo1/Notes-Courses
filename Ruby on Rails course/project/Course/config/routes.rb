Rails.application.routes.draw do
  
  get 'articles/index'

  get 'articles/new'

  get 'articles/edit'

  get 'articles/delete'

  get 'articles/show'

  get 'pages/index'

  get 'pages/show'

  get 'pages/new'

  get 'pages/edit'

  get 'pages/delete'

#  get 'test/index'
	root "test#index"
	match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
