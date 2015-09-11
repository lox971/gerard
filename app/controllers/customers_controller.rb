class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :destroy, :update]

  def index
    @customers = Customer.all
    policy_scope(@customers)
  end

  def show
  end

  def new
    @customer = Customer.new
    authorize @customer
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.id = current_user
    current_user.profile_type = "Customer"
    current_user.save
    authorize @customer
    if @customer.save
      current_user.profile = @customer
      current_user.save
      redirect_to new_course_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @customer = current_user.profile
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy!
  end


  private

  def set_customer
    @customer = current_user.profile
    authorize @customer
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :picture)
  end

end
