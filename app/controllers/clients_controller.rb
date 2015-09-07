class ClientsController < ApplicationController
  after_action :create_contract, only: :create

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

  def create_contract
    sleep(5)

    Contract.create(
        accountid: @user.sfid,
        contractterm: 24,
        customersignedid: @client.reload.personcontactid,
        startdate: Date.today
    )
  end

end