class ProductsController < ApplicationController

  def create
    pricebook = Pricebook.find_by_name 'Standard Price Book'
    # or alternatively, should product be 'Bob's Hourly Rate' and pricebook their entries with clients
    product = Product.create(
      name: "Personal Training with #{@user.name}"
    )

    @pricebook_entry = PricebookEntry.create(
      serviceprovider__c:  user.sfid,
      name:                "#{@user.name}'s Hourly Rate",
      product2id:          product.sfid,
      pricebook2id:        pricebook.sfid,
      unitprice:           50.0,
      isactive:            true
    )
    
    redirect_to root_path
  end

end
