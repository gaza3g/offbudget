class DailiesController < ApplicationController
  
  set_tab :daily
  
  def index
    @user_budget = Budget.where({ :user_id => current_user.id })
    @items = Item.joins(@user_budget).order("name")
  end
  
  def create
    @daily = Daily.new(params[:daily])
    respond_to do |format|
      if @daily.save
        flash[:success] = "Item '#{params[:daily][:name]}' captured."
        format.html { redirect_to dailies_url }
        format.js
      else
        format.html { render dailies_url}
      end
    end
  end
  
  def update
    @new_value = params[:value]
    @daily = Daily.find( params[:id] )
    @old_value = ""
    if params[:attribute] == "name"
      @old_value = @daily.name
      respond_to do |format|
        if @daily.update_attributes( :name => @new_value )
          flash[:success] = "Renamed '#{@old_value}' to '#{@new_value}'"
          format.js
        else
          format.html { render dailies_url }
        end
      end
    else
      @old_value = @daily.amount
      respond_to do |format|
        if @daily.update_attributes( :amount => @new_value )
          flash[:success] = "'#{@daily.name}' amount changed from 
                            '$#{sprintf("%.2f",@old_value)}' to 
                            '$#{sprintf("%.2f",@new_value)}'"
          format.js
        else
          format.html { render dailies_url }
        end
      end
    end
  end
  
  def destroy
    respond_to do |format|
      daily = Daily.find(params[:id])
      name = daily.name
      if daily.destroy
        flash[:success] = "#{name} deleted."
        format.html { redirect_to dailies_url }
        format.js
      else
        format.html {render dailies_url}
      end
    end
  end
  
 
  

end

