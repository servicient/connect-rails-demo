class Product < ActiveRecord::Base
  self.table_name = 'heroku.product2'
  belongs_to :provider, primary_key: 'sfid', foreign_key: 'providerid__c'
  has_many :pricebook_entries, primary_key: 'sfid', foreign_key: 'product2id'
end