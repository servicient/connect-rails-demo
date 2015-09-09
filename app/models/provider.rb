class Provider < Account
  has_many :contracts, primary_key: 'sfid', foreign_key: 'accountid'
  has_one :product, primary_key: 'sfid', foreign_key: 'providerid__c'
  has_one :pricebook_entry, primary_key: 'sfid', foreign_key: 'serviceprovider__c'
  has_many :orders, primary_key: 'sfid', foreign_key: 'accountid'

  def unitprice
    if product.present? and product.pricebook_entries.any?
      product.pricebook_entries.last.unitprice
    end
  end
end