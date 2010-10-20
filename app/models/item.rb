class Item < ActiveRecord::Base
  
  attr_accessible :id, :name, :amount, :budget_id
  
  belongs_to :budget
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
    
end
