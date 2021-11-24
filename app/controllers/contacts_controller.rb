class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      # contact_email and to_h methods
      # left as an exercise to the reader
      # Mailer.contact_email(@contact.to_h).deliver
      redirect_to root_url, notice: 'Email sent!'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
