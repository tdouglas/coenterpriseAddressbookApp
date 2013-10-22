class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = current_user.contacts.all
    render json: @contacts
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
    render json: @contact
  end


  # POST /contacts
  # POST /contacts.json
  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      render json: @contact
    else
      render json: {}
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: {}
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:firstname, :lastname, :email, :phone, :street_address, :apt_address, :city_address, :state_address, :zip_address, :picture)
    end
end
