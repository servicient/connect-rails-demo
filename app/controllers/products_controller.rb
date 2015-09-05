class ProductsController < ApplicationController
  def create
    @product = Product.create(
      name:           "#{@user.name}'s Hourly Rate",
      family:         'Hourly Rate',
      isactive:        true,
      providerid__c:   @user.sfid
    )

    redirect_to root_path
  end
end