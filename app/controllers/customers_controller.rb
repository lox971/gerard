class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end


  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    if @customer.save
      redirect_to customers_path
    else
      raise
      render :new
    end
  end

  def edit
    @customer = current_user.profile
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update
    redirect_to home_path
  end

  def show
    @customer = current_user
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number)
  end

end
