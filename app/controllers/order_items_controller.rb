class OrderItemsController < ApplicationController

  def create
    @order = Order.find_by_sfid params[:order_item][:orderid]
    @order_item = OrderItem.create(
      quantity: params[:order_item][:quantity],
      availablequantity: params[:order_item][:quantity],
      unitprice: params[:order_item][:unitprice],
      orderid: params[:order_item][:orderid],
      pricebookentryid: params[:order_item][:pricebookentryid]
    )
    redirect_to @order
  end

end