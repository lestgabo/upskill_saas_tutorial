class ContactsController < ApplicationController
  
  # GET request to /contact-us
  # Show new contact form
  def new
    # the @ sign means its an instance variable
    @contact = Contact.new
  end
  
  # POST request /contacts
  def create
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the Contact object to the database
    if @contact.save
      # grabs the things inside the form (my comment)
      # Store form fields via parameters, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # fires off email to us, the email is in contact_mailer.rb in app/mailers (my comment)
      # Plug variables into Contact Mailer
      # email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash
      # and redirect to the new action
      flash[:success] = "Message sent."
      redirect_to new_contact_path
    else
      # If Contact object doesn't save
      # store errors in flash hash
      # and redirect to the new action
       flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end

  private
    # To collect data from form, we need to use 
    # strong parameters and whitelist the form fields
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end