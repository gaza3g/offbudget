module BudgetsHelper
  
  def get_all_user_budgets(user_id)
    Budget.all(:conditions => { :user_id => user_id })
  end
  
  def get_all_budget_items(budget_id)
    Item.all(:conditions => { :budget_id => budget_id })
  end
  
end
