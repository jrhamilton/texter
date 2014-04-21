Texter::Application.routes.draw do
 resources :messages, :only => [:index, :new, :create, :show]
 resources :contacts
 root "messages#index"
end
