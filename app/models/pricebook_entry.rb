class PricebookEntry < ActiveRecord::Base
  self.table_name = 'heroku.pricebookentry'

  # belongs_to :service_provider, foreign_key: 'serviceprovider__c', primary_key: 'sfid'
  belongs_to :product, foreign_key: 'product2id', primary_key: 'sfid'
  belongs_to :pricebook, foreign_key: 'pricebook2id', primary_key: 'sfid'
end