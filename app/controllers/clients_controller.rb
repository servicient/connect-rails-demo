class ClientsController < ApplicationController
  # after_action :create_contract, only: :create

  def new
    @client = Client.new
  end

  def create
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
    @client = Client.find params[:id]
  end

  def update
    @client = Client.find params[:id]
    Contract.create(
        accountid: @user.sfid,
        contractterm: 24,
        customersignedid: @client.personcontactid,
        startdate: Date.today
    )
    redirect_to @client
  end

end