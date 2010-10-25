class ItemsController < ApplicationController
  before_filter :load
  
  def load
    if user_signed_in?
      @item ||= Item.new
      @income ||= Income.new
    end
  end
  
  def create
    @current_budget = Budget.find(params[:item][:budget_id])
    @item  = @current_budget.items.build(params[:item])
    respond_to do |format|
      if @item.save
        flash[:success] = "#{@item.name} created!"
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html { render budgets_url}
      end
    end
    return @current_budget
  end

  def update
    @new_value = params[:value]
    @item = Item.find( params[:id] )
    @old_value = ""
    if params[:attribute] == "name"
      @old_value = @item.name
      respond_to do |format|
        if @item.update_attributes( :name => @new_value )
          flash[:success] = "Renamed '#{@old_value}' to '#{@new_value}'"
          format.js
        else
          format.html { render budgets_url }
        end
      end
    else
      @old_value = @item.amount
      respond_to do |format|
        if @item.update_attributes( :amount => @new_value )
          flash[:success] = "'#{@item.name}' amount changed from 
                            '$#{sprintf("%.2f",@old_value)}' to 
                            '$#{sprintf("%.2f",@new_value)}'"
          format.js
        else
          format.html { render budgets_url }
        end
      end
    end
  end
  
  def destroy
    respond_to do |format|
      item = Item.find(params[:id])
      @budget = Budget.find(item.budget_id)
      name = item.name
      if item.destroy
        flash[:success] = "#{name} deleted."
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html {render budgets_url}
      end
    end
    return @budget
  end

end
