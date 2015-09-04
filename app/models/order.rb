class Order < ActiveRecord::Base
  self.table_name = 'heroku.order'
  belongs_to :contract, primary_key: 'sfid', foreign_key: 'contractid'
  belongs_to :pricebook, primary_key: 'sfid', foreign_key: 'pricebook2id'
  has_many :order_items, primary_key: 'sfid', foreign_key: 'orderid'
  has_many :events, primary_key: 'sfid', foreign_key: 'whatid'

  delegate :client, :account, to: :contract
end