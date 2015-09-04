class Event < ActiveRecord::Base
  self.table_name = 'heroku.event'
  belongs_to :order, primary_key: 'sfid', foreign_key: 'whatid'

  def starts
    startdatetime.strftime('%a, %b %l at %m %M %p')
  end

  def ends
    enddatetime.strftime('%a, %b %l at %m %M %p')
  end

end