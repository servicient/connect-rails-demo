class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @order = Order.find_by_sfid params[:order]

    @event = Event.create(
      subject: "Session with #{@order.client.name}",
      whatid: @order.sfid,
      whoid: @order.client.personcontactid,
      accountid: @order.provider.sfid,
      startdatetime: Time.now,
      enddatetime: 1.hour.from_now
    )

    @event.order.order_items.last.update(availablequantity: (@event.order.order_items.last.availablequantity - 1))

    # reduce available quantity of order?
    # when it's created...option to change price
    # and boolean below to say 'change this for future events on this order'

    redirect_to order_path(@order)
  end

end