class Client::ContactsController < ApplicationController

  def index
    response = HTTP.get("http://localhost:3000/api/contacts")
    @contacts = response.parse
    render 'index.html.erb'
  end

end
