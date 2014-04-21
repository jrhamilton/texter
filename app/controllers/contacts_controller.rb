class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Contact Saved"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(parms[:id])
  end

  def update
    @contact.update(contact_params)
  end

  def delete
    @contact = Contact.find(params[:id])
  end

private
  def contact_params
    params.require(:contact).permit(:name, :number)
  end

end
