module DailiesHelper
  
  def get_daily_expenditure
    user_budget = Budget.where({ :user_id => current_user.id })
    items = Item.joins(user_budget).order("name")
    @dailies = Daily.where({ :item_id => items})
    @dailies = @dailies.where(["DATE(created_at) = DATE(?)", Time.now])
  end
  
  def get_monthly_expenditure
    user_budget = Budget.where({ :user_id => current_user.id })
    items = Item.joins(user_budget).order("name")
    @dailies = Daily.where({ :item_id => items})
    #@dailies = @dailies.where(["MONTH(created_at) = ? AND YEAR(created_at) = ?", Time.now.month, Time.now.year])
  end
  
  def get_amount_left_this_month
    consolidate_items_amount - get_monthly_expenditure.sum('amount')
  end
  


end
