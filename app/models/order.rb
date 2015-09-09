class Order < ActiveRecord::Base
  self.table_name = 'heroku.order'
  belongs_to :client, primary_key: 'personcontactid', foreign_key: 'customerauthorizedbyid'
  belongs_to :provider, primary_key: 'sfid', foreign_key: 'accountid'

  belongs_to :pricebook, primary_key: 'sfid', foreign_key: 'pricebook2id'
  has_many :order_items, primary_key: 'sfid', foreign_key: 'orderid'
  has_many :events, primary_key: 'sfid', foreign_key: 'whatid'

end