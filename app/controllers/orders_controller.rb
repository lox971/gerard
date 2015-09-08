class OrdersController < ApplicationController

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end

  def create
    @course = Course.find(params[:course_id])
    order = Order.create!(course_sku: @course.sku, amount: @course.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

end
