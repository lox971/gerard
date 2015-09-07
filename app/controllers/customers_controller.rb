class CustomersController < ApplicationController

  before_action :set_customer, only: [:show, :edit, :destroy, :update]

  def index
    @customers = Customer.all
    policy_scope(@customers)
  end

  def show
    @customer = current_user
  end


  def new
    @customer = Customer.new
    authorize @customer
  end


  def create
    @customer = Customer.new(customer_params)
    @customer.user = current_user
    authorize @customer
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
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def destroy
    @customer.destroy!
  end


  private

  def set_customer
    @customer = Customer.find(params[:id])
    authorize @customer
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone_number, :picture)
  end

end
