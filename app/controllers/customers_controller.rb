class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end


  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    if @customer.save
      redirect_to new_course_path
    else
      render :new
    end
  end

  def edit
    @customer = current_user.profile
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to new_course_path
    else
      render :edit
    end
  end

  def show
    @customer = current_user
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number)
  end

end
