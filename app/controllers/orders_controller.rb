class OrdersController < ApplicationController
  skip_after_action :verify_authorized


  def index
    @orders = policy_scope(Order)
  end
  def create

    product = Product.find(params[:product_id])
    order  = Order.create!(product_id: product.id, amount: product.price, state: 'pending', user_id: current_user.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
end
