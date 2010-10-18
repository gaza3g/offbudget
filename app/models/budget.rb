class Budget < ActiveRecord::Base
  attr_accessible :id, :name, :user_id
  
  belongs_to :user
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
end
