class OrderItem < ActiveRecord::Base
  self.table_name = 'heroku.orderitem'
  belongs_to :order, primary_key: 'sfid', foreign_key: 'orderid'
end