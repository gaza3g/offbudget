class BudgetsController < ApplicationController
  before_filter :load
  
  def load
    if user_signed_in?
      @budget ||= Budget.new
      @item ||= Item.new
      @income ||= Income.new
    end
  end
  
  def index
  end

  def create
    name = params[:budget][:name]
    @budget  = current_user.budgets.build(params[:budget])
    respond_to do |format|
      if @budget.save
        flash[:success] = "#{name} created!"
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html { render budgets_url}
      end
    end
  end

  def update
    @new_budgetname = params[:value]
    @budget = Budget.find( params[:id] )
    @old_budgetname = @budget.name
    respond_to do |format|
      if @budget.update_attributes( :name => @new_budgetname )
        flash[:success] = "Renamed '#{@old_budgetname}' to '#{@new_budgetname}'"
        
        format.js
      else
        format.html { render budgets_url }
      end
    end
  end

  def destroy
    name = Budget.find(params[:id]).name
    respond_to do |format|
      if Budget.find(params[:id]).destroy
        flash[:success] = "#{name} deleted."
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html {render budgets_url}
      end
    end
  end
  
  
  
end
