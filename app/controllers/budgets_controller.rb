class BudgetsController < ApplicationController
  
  def index
    @budget = Budget.new if user_signed_in?
  end

  def create
    name = params[:budget][:name]
    @budget  = current_user.budgets.build(params[:budget])
    respond_to do |format|
      if @budget.save
        flash[:success] = "#{name} created!"
        #redirect_to budgets_url
        format.html { redirect_to budgets_url }
        format.js
      else
        #render budgets_url
        format.html { render budgets_url}
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
    #redirect_to budgets_path
  end
  
end
