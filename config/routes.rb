W4D2::Application.routes.draw do
  resources :users, :only => [:create, :destroy, :index, :show, :update] do
    resources :contacts, :only => [:index]
    member do
      get 'favorites'
    end
  end
  resources :contacts, :only => [:create, :destroy, :show, :update]
  resources :contact_shares, :only => [:create, :destroy]
  # get 'user/:id' => 'users#show'
  # get 'users(.:format)' => 'users#index'
  # post 'users(.:format)' => 'users#create'
  # get 'users/new(.:format)' => 'user#new'
  # get 'users/:id/end(.:format)' => 'users#edit'
  # patch 'users/:id(.format)' => 'users#update'
  # put 'users/:id(.:format)' => 'users#update'
  # delete 'users/:id(.:format)' => 'users#destroy'
end