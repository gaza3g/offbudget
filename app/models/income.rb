class Income < ActiveRecord::Base
  
  attr_accessible :id, :amount, :user_id
  
  belongs_to  :user
  
  validates :amount, :presence => true
  
end
