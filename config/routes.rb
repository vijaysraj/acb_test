Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'invoices#index'  
  get '/invoices' => "invoices#index", as: :invoices
  get 'invoice/:id' => "invoices#show", as: :invoice

  get '/invoices/new' => "invoices#new", as: :new_invoice
  post '/invoices' => "invoices#create", as: :create_invoice

  get '/invoice/:invoice_id/collections/new' => "collection#new", as: :new_collection
  post '/invoice/:invoice_id/collections' => "collection#create", as: :create_collection

end
