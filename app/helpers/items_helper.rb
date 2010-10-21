module ItemsHelper
  
  def consolidate_items_amount
    @total = 0.00
    current_user.budgets.each do |budget|
      @total += budget.items.sum('amount')
    end
    return @total
  end
  
  def amount_after_deduction
    Income.find_by_user_id(current_user.id).amount - consolidate_items_amount
    #not supported in heroku
    #current_user.income.amount - consolidate_items_amount
  end
  
end
