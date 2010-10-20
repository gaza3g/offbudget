class Budget < ActiveRecord::Base
  attr_accessible :id, :name, :user_id
  
  belongs_to  :user
  has_many    :items, :dependent => :destroy
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
  
end
