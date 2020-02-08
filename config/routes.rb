Rails.application.routes.draw do
  namespace :client do
   get '/contacts' => 'contacts#index' 
  end
end
