module DailiesHelper
  
  def get_daily_expenditure
   get_all_dailies.where({ :created_at => (Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) })
  end
  
  def get_monthly_expenditure
    get_all_dailies.where({ :created_at => (Time.zone.now.beginning_of_month..Time.zone.now.end_of_month) })
  end
  
  def get_amount_left_this_month
    consolidate_items_amount - get_monthly_expenditure.sum('amount')
  end
  
  def get_all_dailies(user_id=current_user.id)
    user_budget = Budget.where({ :user_id => user_id })
    items = Item.joins(user_budget).order("name")
    @dailies = Daily.where({  :item_id => items })
  end

end
