class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = policy_scope(Product)
  end
end
