class Account < ActiveRecord::Base
  self.table_name = 'heroku.account'
  has_one :pricebook_entry, primary_key: 'sfid', foreign_key: 'serviceprovider__c'
  has_many :contracts, primary_key: 'sfid', foreign_key: 'accountid'
  # has_many :contacts, :primary_key => "sfid", :foreign_key => "accountid"

  # attr_protected :CreatedDqate, :SystemModstamp, :LastModifiedDate
  def name
    firstname + " " + lastname
  end
  
end
