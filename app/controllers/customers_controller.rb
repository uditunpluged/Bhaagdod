class CustomersController < ApplicationController
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
        :name, :email, :phone,
        addresses_attributes: [:street_addr, :city, :state, :country, :pincode, :preffered, :customer_id]
    )
  end

end
