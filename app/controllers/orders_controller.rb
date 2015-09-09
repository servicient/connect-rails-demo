class OrdersController < ApplicationController
  def create 
    pricebook = Pricebook.find_by_name 'Standard Price Book'
    @contract = Contract.find params[:contract]

    # re: @client.contracts.last just turn current clients resource into contracts resource
    @order = Order.create(
      accountid: @user.sfid,
      # contractid: @contract.sfid, 
      pricebook2id: pricebook.sfid,
      effectivedate: Date.today,
      status: 'Draft'
    )

    redirect_to @order
  end

  def show
    @order = Order.find params[:id]
  end

  def update

    @order = Order.find params[:id]
    pricebook_entry = PricebookEntry.find_by_sfid @user.pricebook_entry.sfid

    # Quantity and Cost
    OrderItem.create(
      orderid: @order.sfid,
      pricebookentryid: pricebook_entry.sfid,
      quantity: 10,
      listprice: params[:unit_price] || pricebook_entry.unitprice,
      unitprice: params[:unit_price] || pricebook_entry.unitprice

    )
    # quantity not required
    redirect_to @order
  end
end