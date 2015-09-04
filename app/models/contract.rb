class Contract < ActiveRecord::Base
  self.table_name = 'heroku.contract'

  belongs_to :account,   foreign_key: 'accountid',   primary_key:  'sfid'
  belongs_to :client, class_name: 'Client', foreign_key: 'customersignedid', primary_key:  'personcontactid'
  has_many :orders, foreign_key: 'contractid', primary_key: 'sfid'

end