Texter::Application.routes.draw do
 resources :messages, :only => [:index, :new, :create, :show]
 resources :contacts
 match('inbound_messages', {:via => :post, :to => 'inbound_messages#index'})
 root :to => "messages#index"
end
