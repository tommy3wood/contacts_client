class Client::ContactsController < ApplicationController

  def index
    response = HTTP.get("http://localhost:3000/api/contacts")
    @contacts = response.parse
    render 'index.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
    client_params = {
                      first_name: params[:first_name],
                      middle_name: params[:middle_name],
                      last_name: params[:last_name],
                      bio: params[:bio],
                      email: params[:email],
                      phone_number: params[:phone_number]
                      }
    response = HTTP.post(
                          "http://localhost:3000/api/contacts",
                          form: client_params
                          )
    contact = response.parse
    redirect_to "/client/contacts/#{ contact["id"] }"
  end

  def show
    response = HTTP.get("http://localhost:3000/api/contacts/#{params[:id]}")
    @contact = response.parse
    render 'show.html.erb'
  end

  def edit
    response = HTTP.get("http://localhost:3000/api/contacts/#{params[:id]}")
    @contact = response.parse
    render 'edit.html.erb'
  end

  def update
    client_params = {
                  first_name: params[:first_name],
                  middle_name: params[:middle_name],
                  last_name: params[:last_name],
                  group: params[:group],
                  bio: params[:bio],
                  email: params[:email],
                  phone_number: params[:phone_number]
                  }
    response = HTTP.patch(
                          "http://localhost:3000/api/contacts/#{params[:id]}",
                          form: client_params
                          )
    contact = response.parse
    redirect_to "/client/contacts/#{ contact["id"] }"
  end

  def destroy
    response = HTTP.delete("http://localhost:3000/api/contacts/#{params[:id]}")
    redirect_to '/client/contacts'
  end

end
