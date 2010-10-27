class Item < ActiveRecord::Base
  
  attr_accessible :id, :name, :amount, :budget_id, :quantity
  
  belongs_to :budget
  has_many    :dailies, :dependent => :destroy
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  def dailies_total
    self.dailies.sum('amount')
  end
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
    
end
