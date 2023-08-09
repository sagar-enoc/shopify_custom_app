# frozen_string_literal: true

class OrdersController < AuthenticatedController
  def index
    @orders = ShopifyAPI::Order.all(status: 'any').map(&:original_state)
  end

  def show
    @order = ShopifyAPI::Order.find(id: params[:id])
  end
end
