class TablesController < ApplicationController
  
  def edit
      @tables = Table.all
  end

  def create
    	@table = Table.new
  end

  def index
  	render json: custom_json(Restaurant.first.tables) #TODO obviously not its final form
  end

  def update(party)
  	self.party = party
  	respond_to do |format|
  		format.js {}
  		format.json { render json: self.name}
  		#format.html
	  end
  end

  private
  

  def custom_json(tables)
    circs = tables.where(type: "RoundTable")
    rects = tables.where(type: "RectTable")
    
    list = {
      :rounds => round_table_json(circs),
      :quads => rect_table_json(rects)
    }
    list.to_json
  end

  def round_table_json(tables)
    list = tables.map do |table| #Obviously room for improvement here
      {
        :cx => table.x,
        :cy => table.y,
        :rad => table.radius,
        #:fill => table.fill
      }
    end
    list.to_json
  end

  def rect_table_json(tables)
    list = tables.map do |table| #Obviously room for improvement here
      {
        :x => table.x,
        :y => table.y,
        :width => table.width,
        :height => table.height,
      }
      end
      list.to_json
  end
  
end
