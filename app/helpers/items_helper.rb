module ItemsHelper
  
  def consolidate_items_amount
    @total = 0.00
    current_user.budgets.each do |budget|
      @total += budget.items.sum('amount')
    end
    return @total
  end
  
  def amount_after_deduction
    if current_user.income
      current_user.income.amount - consolidate_items_amount
    end
  end
  
end
