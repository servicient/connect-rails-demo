class ClientsController < ApplicationController
  after_action :create_initial_order, only: :create

  def new
    @client = Client.new
  end

  def create
    @client = Client.find_by_personemail params[:client][:personemail]
    
    if @client.blank?
      @client = Client.create(

        firstname:   params[:client][:firstname], 
        lastname:    params[:client][:lastname],
        personemail: params[:client][:personemail]
      )
    end
    redirect_to root_path
  end

  def show
    @client = Client.find params[:id]
  end

  private

  # def create_contract
  #   Contract.create(
  #       accountid: @user.sfid,
  #       contractterm: 24,
  #       customersignedid: @client.reload.personcontactid,
  #       startdate: Date.today
  #   )
  # end

    def create_initial_order
      sleep(10)
      pricebook = Pricebook.find_by_name 'Standard Price Book'

      @order = Order.create(
        accountid: @user.sfid,
        customerauthorizedbyid: @client.reload.personcontactid,
        pricebook2id: pricebook.sfid,
        effectivedate: Date.today,
        status: 'Draft' # make an activated or whatever status
      )
    end
end