module ApplicationHelper
  
  def title
    base_title = "OffBudget"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def get_daily_expenditure
    user_budget = Budget.where({ :user_id => current_user.id })
    items = Item.joins(@user_budget).order("name")
    dailies = Daily.where({ :item_id => @items  })
  end
  
end
