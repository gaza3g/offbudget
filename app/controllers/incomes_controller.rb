class IncomesController < ApplicationController
  
  def create
    amount = params[:income][:amount]
    @income  = current_user.build_income(params[:income])
    respond_to do |format|
      if @income.save
        flash[:success] = "Changed disposable income to $#{amount}"
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html { render budgets_url}
      end
    end
  end
  
  def update
    @new_amount = params[:value]
    @income = current_user.income
    respond_to do |format|
      if @income.update_attributes( :amount => @new_amount )
        flash[:success] = "Changed disposable income to $#{@new_amount}"
        format.js
      else
        format.html { render :nothing }
      end
    end
  end
  
end
