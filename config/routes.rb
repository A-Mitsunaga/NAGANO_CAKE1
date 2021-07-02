Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root :to => 'homes#top'
get '/about' => 'homes#about'

resource :customers, only: [:edit, :update]
get '/customers/my_page' => 'customers#show'
patch 'customers/edit' => 'customers#update'
patch '/customers/withdrawal' => 'customers#withdrawal'
get '/customers/unsubscribe' => 'customers#unsubscribe'


resources :items, only: [:index, :show]

post '/orders/confirm' => 'orders#confirm'
get '/orders/thanks' => 'orders#thanks'
resources :orders, only: [:new, :create, :index, :show]

resources :addresses, only: [:index, :edit, :create, :update, :destroy]

resources :cart_items, only: [:index, :destroy, :update, :create] do
collection do
  delete 'destroy_all'
end
end


namespace :admin do
  resources :items, except: [:create]
  post '/items/new' => 'items#create'
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  get '/' => 'homes#top'
end

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

end
