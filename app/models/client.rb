class Client < Account
  has_many :contracts, primary_key: 'personcontactid', foreign_key: 'customersignedid'

end