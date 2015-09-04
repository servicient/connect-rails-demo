class ClientsController < ApplicationController
  # after_action :create_contract, only: :create

  def new
    @client = Client.new
  end

  def create
    @contract =
    @client = Client.find_by_personemail params[:client][:personemail]
    
    if @client.blank?
      @client = Client.create(

        firstname:   params[:client][:firstname], 
        lastname:    params[:client][:lastname],
        phone:       params[:client][:phone],
        personemail: params[:client][:personemail]
      )
    end

    redirect_to @client
  end

  def show
    @contract = Contract.find_by_sfid params[:contract]
    @client = @contract.client
  end

  def update
    # client record doesn't get sfid fast enough, can take up to a cpl min
    # but maybe contracts don't need to play this role, could just be orders
    @client = Client.find params[:id]
    Contract.create(
        accountid: @user.sfid,
        contractterm: 24,
        customersignedid: @client.personcontactid,
        startdate: Date.today
    )
    redirect_to root_path
  end

end