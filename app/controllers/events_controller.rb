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
      accountid: @order.account.sfid,
      startdatetime: Time.now,
      enddatetime: 1.hour.from_now
    )

    redirect_to order_path(@order)
  end

end