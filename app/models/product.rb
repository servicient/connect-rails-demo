class Product < ActiveRecord::Base
  self.table_name = 'heroku.product2'

  def create
    Product.create(
      name:           "#{@user.name}'s Hourly Rate",
      productfamily: 'Hourly Rate',
      active:         true
    )
  end

  # product family
  # 
end