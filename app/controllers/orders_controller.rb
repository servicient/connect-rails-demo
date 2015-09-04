class OrdersController < ApplicationController
  def create
    pricebook = Pricebook.find_by_name 'Standard Price Book'

    @order  = Order.find_by_sfid params[:order]
    @client = Client.find_by_sfid params[:client]
    # re: @client.contracts.last just turn current clients resource into contracts resource
    @order = Order.create(
      accountid: @user.sfid,
      contractid: @client.contracts.last.sfid, 
      pricebook2id: pricebook.sfid,
      effectivedate: Date.today,
      status: 'Draft'
    )

    flash[:notice] = 'After waiting cpl min or so to make sure that the contract syncs there and back. :-0'

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