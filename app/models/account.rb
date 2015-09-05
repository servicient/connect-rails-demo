class Account < ActiveRecord::Base
  self.table_name = 'heroku.account'
  def name
    firstname + " " + lastname
  end
  
end
