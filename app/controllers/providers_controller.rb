class ProvidersController < ApplicationController

  def new
    @provider = Provider.new
  end

  def create
    @user.setup_provider_account(params[:provider][:unitprice])

    redirect_to root_path
  end

end
