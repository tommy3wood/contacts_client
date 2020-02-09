Rails.application.routes.draw do
  namespace :client do
   get '/contacts' => 'contacts#index' 
   get '/contacts/new' => 'contacts#new'
   post '/contact' => 'contacts#create'
   get '/contacts/:id' => 'contacts#show'
   get '/contacts/:id/edit' => 'contacts#edit'
   patch '/contacts/:id' => 'contacts#update'
   delete '/contacts/:id' => 'contacts#destroy'
  end
end
