class ItemsController < ApplicationController
  
  def create
    @current_budget = Budget.find(params[:item][:budget_id])
    item  = @current_budget.items.build(params[:item])
    respond_to do |format|
      if item.save
        flash[:success] = "#{item.name} created!"
        format.html { redirect_to budgets_url }
        format.js
      else
        format.html { render budgets_url}
      end
    end
    return @current_budget
  end

  def update
    @new_itemname = params[:value]
    @item = Item.find( params[:id] )
    @old_itemname = @item.name
    respond_to do |format|
      if @item.update_attributes( :name => @new_itemname )
        flash[:success] = "Renamed '#{@old_itemname}' to '#{@new_itemname}'"
        format.js
      else
        format.html { render budgets_url }
      end
    end
  end
  
  def destroy
    puts params[:confirm]
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
