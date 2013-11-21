class TablesController < ApplicationController
  
  def edit

  end

  def create
      @table = Table.new
  end

  def index
    render json: custom_json(Restaurant.first.tables) #TODO obviously not its final form.  Eventually refactor restaurants out into a resource
  end

  def update
   @table = Table.find(params[:id])
  # @waiter = Waiter.find_by :name => params[:data]
    respond_to do |format|
      format.json {json: @table}
    end
  end

  private
  

  def custom_json(tables)
    circs = tables.where(type: "RoundTable")
    rects = tables.where(type: "RectTable")
    
    list = []
    circs.each do |table|
      list << round_table_json(table)
    end
    rects.each do |table|
      list << rect_table_json(table)
    end
    list.to_json
  end

  def round_table_json(table)
       jsonified =  {
        :type => "circle",
        :cx => table.x,
        :cy => table.y,
        :r => table.radius,
        :fill => '#000'
      }
    jsonified
  end

  def rect_table_json(table)
       jsonified = {
        :type => "rect",
        :x => table.x,
        :y => table.y,
        :width => table.width,
        :height => table.height,
        :fill => '#000'
      }
      jsonified
  end
  
end
