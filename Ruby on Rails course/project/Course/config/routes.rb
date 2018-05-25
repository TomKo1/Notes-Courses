Rails.application.routes.draw do
  
  get 'pictures/new'

  get 'pictures/show'

  get 'pictures/edit'

  get 'pictures/delete'
  
  get 'pictures/index'

  get 'images/index'

  get 'images/new'

  get 'images/show'

  get 'images/edit'

  get 'images/delete'

  get 'galleries/index'

  get 'galleries/new'

  get 'galleries/show'

  get 'galleries/edit'

  get 'galleries/delete'

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
