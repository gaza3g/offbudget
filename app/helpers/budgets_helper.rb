module BudgetsHelper
  
  def get_all_user_budgets(user_id)
    Budget.all(:conditions => { :user_id => user_id })
  end
  
end
