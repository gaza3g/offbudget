class BudgetsController < ApplicationController
  def index
    @budget = Budget.new if user_signed_in?
  end

  def create
    name = params[:budget][:name]
    @budget  = current_user.budgets.build(params[:budget])
    if @budget.save
      flash[:success] = "#{name} created!"
      redirect_to budgets_url
    else
      render budgets_url
    end
    
  end

  def destroy
    name = Budget.find(params[:id]).name
    Budget.find(params[:id]).destroy
    flash[:success] = "#{name} deleted."
    redirect_to budgets_url
  end
  
end
