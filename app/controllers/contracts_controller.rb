class ContractsController < ApplicationController

  def show
    @contract = Contract.find params[:id]
    @client   = @contract.client
  end

end