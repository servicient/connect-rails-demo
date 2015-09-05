class PricebookEntriesController < ApplicationController
  def new
    @pricebook_entry = PricebookEntry.new
  end

  def create
    @pricebook_entry = PricebookEntry.create(
      name:                "#{@user.name}'s Hourly Rate",
      product2id:          @user.product.sfid,
      pricebook2id:        pricebook.sfid,
      unitprice:           params[:pricebook_entry][:unitprice],        
      isactive:            true
    )

    redirect_to root_path
  end

  def edit
    @pricebook_entry = PricebookEntry.find_by_sfid params[:id]
  end

  def update
    @pricebook_entry = PricebookEntry.find params[:id]
    @pricebook_entry.update(unitprice: params[:pricebook_entry][:unitprice])
    redirect_to root_path
  end

  private
    # Default Pricebook. Future Pricebooks could include
    # Card on File and Marketing Clients
    def pricebook
      pricebook = Pricebook.find_by_name 'Standard Price Book'
    end
end