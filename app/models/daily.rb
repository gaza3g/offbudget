class Daily < ActiveRecord::Base
  
  attr_accessible :id, :name, :amount, :item_id
  
  belongs_to :item
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
  
end
