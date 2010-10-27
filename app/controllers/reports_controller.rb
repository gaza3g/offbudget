require 'google_chart'

class ReportsController < ApplicationController
  before_filter :authenticate_user!
  set_tab :report
  
  def index
    
    GoogleChart::PieChart.new('350x250', "Budgeted Expenditure",false) do |pc| 
      Budget.all_items(current_user.id).each do |item|
        pc.data item.name, item.amount
      end
      @graph_budgeted = pc.to_url
    end
    
    GoogleChart::PieChart.new('350x250', "Actual Expenditure",false) do |pc| 
      Budget.all_items(current_user.id).each do |item|
        pc.data item.name, item.dailies_total
      end
      @graph_calculated = pc.to_url
    end
    
    total_days = Time.days_in_month(Time.zone.now.month, Time.zone.now.year)
    @data = Array.new
    total_days.times.each do |d|
      @data.push Daily.expenditure_for_day( current_user.id, Date.new(Time.zone.now.year,Time.zone.now.month,d+1))
    end
    
    lc = GoogleChart::LineChart.new("350x250", "Spending trends for this month", false)
    lc.data "Daily expenditure", @data, '00ff00'
    lc.axis :y, :range => [0,@data.max], :color => 'ff00ff', :font_size => 16, :alignment => :center
    lc.axis :x, :range => [0, total_days], :color => '00ffff', :font_size => 16, :alignment => :center
    lc.grid :x_step => 30, :y_step => @data.max/5, :length_segment => 1, :length_blank => 0
    lc.show_legend = false
    lc.shape_marker :circle, :color => '0000ff', :data_set_index => 0, :data_point_index => -1, :pixel_size => 5
    @graph_line = lc.to_url

    puts @data
  end
  
end
