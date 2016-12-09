class CustomersController < ApplicationController

  after_action :update_customer, only: :create

  def index
    @customers=Customer.all
  end

  def edit
  end

  def update
  end

  def delete
    @customer=Customer.find params[:id]
  end

  def destroy
    @customer=Customer.find params[:id]
    @customer.destroy
    redirect_to customers_path
  end

  def new
    @customer=Customer.new
    @customer.addresses.build
  end

  def create
    @customer=Customer.new(customer_params)
    if @customer.save
      @customer.address_id = Address.where(:customer => @customer.id)
      @customer.update(user_params)
      redirect_to customers_path
    else
      redirect_to new_customer_path
    end
  end

  def show
  end

  private

  def customer_params
    params.require(:customer).permit(
        :name, :email, :phone, :address_id,
        addresses_attributes: [:street_addr, :city, :state, :country, :pincode, :preffered, :customer_id]
    )
  end

  def user_params
    params.require(:customer).permit(:address_id)
  end

  def update_customer
  end

end
