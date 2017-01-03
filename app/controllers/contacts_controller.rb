class ContactsController < ApplicationController
  def new
    # the @ sign means its an instance variable
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # grabs the things inside the form
     name = params[:contact][:name]
     email = params[:contact][:email]
     body = params[:contact][:comments]
      # fires off email to us, the email is in contact_mailer.rb in app/mailers
      ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
       flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end