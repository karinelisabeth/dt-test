class ContactsController < ApplicationController
  respond_to :json
  
  def index
    respond_with collection.all
  end

  private
  
  def collection
    apply_scopes Contact
  end
  
end
