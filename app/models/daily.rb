class Daily < ActiveRecord::Base
  
  attr_accessible :id, :name, :amount, :item_id
  
  belongs_to :item
  
  validates :name, :length => { :minimum => 3, :maximum => 50 }
  
  before_save :capitalize_name
  
  def self.expenditure_for_day(user_id, query_date)
    items = Budget.all_items(user_id)
    dailies = Daily.where({:item_id => items, :created_at => (query_date.beginning_of_day..query_date.end_of_day)})
    dailies = dailies.sum("amount")
  end
  
  def self.most_expensive_daily_this_month(user_id)
    items = Budget.all_items(user_id)
    dailies = Daily.where({:item_id => items, :created_at => (Time.zone.now.beginning_of_month..Time.zone.now.end_of_day)}).order("amount DESC")
    dailies.first
  end
  
  private
    
    def capitalize_name
      self.name = self.name.capitalize
    end
  
end
