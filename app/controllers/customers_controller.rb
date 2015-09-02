class CustomersController < ApplicationController

  def new
    @customer = Customer.new

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


end
