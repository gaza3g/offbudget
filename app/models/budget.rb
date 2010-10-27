class Budget < ActiveRecord::Base
  attr_accessible :id, :name, :user_id
  
  belongs_to  :user
  has_many    :items, :dependent => :destroy
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  def self.all_items(user_id)
    @items = Array.new
    budgets = Budget.where({:user_id => user_id})
    budgets.each do |budget|
      budget.items.each do |item|
        @items.push item
      end
    end
    return @items
  end
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
  
end
