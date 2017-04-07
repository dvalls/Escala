class ContactsController < ApplicationController
  before_filter :user_admin?, only: [ :edit, :update]


  before_action :set_contact_and_load_images, only: [:show, :edit, :update]

  def show
  end

  def edit
  end


  def update
    if @contact.update(contact_params)
      redirect_to contact_path, notice: t('views.updated_ok')
    end
  end

  private
  def set_contact_and_load_images
    @contact = Contact.first_or_create!
    @images = @contact.images
  end

  def contact_params
    params.require(:contact).permit(:body)
  end


end
