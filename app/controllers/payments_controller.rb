class PaymentsController < ApplicationController
  before_action :set_course

  def new
  end

  def create
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email: params[:stripeEmail]
    )
    # You should store this customer id and re-use it.

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount:       @course.price_cents,  # in cents
      description:  "Payment for course #{@course.sku} for order #{@course.id}",
      currency:     'eur'
    )

    @course.update(payment: charge.to_json, status: 'paid')

    redirect_to customer_path(current_user)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_course_payment_path(@course)
  end

  private

  def set_course
    @course = Course.where(status: 'pending').find(params[:course_id])
  end

end
