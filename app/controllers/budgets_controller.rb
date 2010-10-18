class BudgetsController < ApplicationController
  def index
    @budget = Budget.new if user_signed_in?
  end

  def create
    @budget  = current_user.budgets.build(params[:budget])
    if @budget.save
      flash[:success] = "Budget created!"
      redirect_to index
    else
      render index
    end
  end

end
