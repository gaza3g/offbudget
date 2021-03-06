require 'google_chart'

class ReportsController < ApplicationController
  before_filter :authenticate_user!
  set_tab :report
  
  def index
    @graph_budgeted = generate_budgeted_expenses
    @graph_calculated = generated_calculated_expenses
    @graph_line = generate_daily_expenses_for_current_month
    @items = Budget.all_items(current_user.id)

    @daily_most_expensive = Daily.most_expensive_daily_this_month(current_user.id)
    @avg_daily_expenditure = (@data.inject {|sum, n| sum + n })/@data.length
    @overspent_category = calculate_overspent_category
  end
  
  private
  
    def calculate_overspent_category
      if @items.any?
        overspent_category = @items.first.name      
        calculate_overspent_category = @longest = @items.flatten.inject(0) do |memo,item|   
          val = item.dailies_total - item.amount
          if memo >= val
            memo
          else
            overspent_category = item.name
            memo = val
          end
        end  
        calculate_overspent_category <= 0 ? "None" : overspent_category
      else
        "None"
      end
    end
  
    def generate_budgeted_expenses
      GoogleChart::PieChart.new('350x250', "Budgeted Expenditure",false) do |pc| 
        Budget.all_items(current_user.id).each do |item|
          pc.data item.name, item.amount
        end
        return pc.to_url
      end
    end
    
    def generated_calculated_expenses
      GoogleChart::PieChart.new('350x250', "Actual Expenditure",false) do |pc| 
        Budget.all_items(current_user.id).each do |item|
          pc.data item.name, item.dailies_total
        end
        return pc.to_url
      end
    end
    
    def generate_daily_expenses_for_current_month
      total_days = Time.days_in_month(Time.zone.now.month, Time.zone.now.year)
      @data = Array.new
      
      total_days.times.each do |d|
        @day_obj = Hash.new
        @data.push Daily.expenditure_for_day( current_user.id, Date.new(Time.zone.now.year,Time.zone.now.month,d+1))
      end
      
      lc = GoogleChart::LineChart.new("350x250", "Spending trends for this month", false)
      lc.data "Daily expenditure", @data, '00ff00'
      lc.axis :y, :range => [0,@data.max], :color => 'ff00ff', :font_size => 16, :alignment => :center
      lc.axis :x, :range => [0, total_days], :color => '00ffff', :font_size => 16, :alignment => :center
      lc.grid :x_step => 30, :y_step => @data.max/5, :length_segment => 1, :length_blank => 0
      lc.show_legend = false
      lc.shape_marker :circle, :color => '0000ff', :data_set_index => 0, :data_point_index => -1, :pixel_size => 5
      return lc.to_url
    end
    
  
  
end


















