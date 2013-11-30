class TablesController < ApplicationController
	
	def edit

	end

	def create
			@table = Table.new
	end

	def index
		render json: custom_json(Restaurant.first.tables)   #TODO obviously not its final form.  Eventually refactor restaurants out into a resource
	end 

	def update
		@table = Table.find(params[:id])
		if params[:type] == "waiter"
			@waiter = Waiter.find_by_name params[:data]
			@table.waiter = @waiter
			@table.save
			render json: {:data => "waiter", :name=> @table.waiter.name, :table => @table.id} and return
		elsif params[:type] == "party"
	  if not @table.waiter?
		render json: {:data => "fail", :message => "That table does not have a waiter"} and return
	  end
			@party = Party.find_by_id params[:data]
			if @table.party
		render json: {:data => "fail", :message => "That table already has a party assigned"} and return	
	  else
		@table.party = @party
				render json: {:data => "party", :name=> @table.party.id, :table => @table.id} and return
			end
		end
	end

	private

	def custom_json(tables)
		list = []
		tables.where(type: "RoundTable").each do |table|
			list << round_table_json(table)
		end
		tables.where(type: "RectTable").each do |table|
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
				:fill => '#000',
				:title => table.id
			}
			jsonified[:waiter] = table.waiter.name if table.waiter?
			jsonified[:party] = table.party?
			jsonified
	end

	def rect_table_json(table)
			 jsonified = {
				:type => "rect",
				:x => table.x,
				:y => table.y,
				:width => table.width,
				:height => table.height,
				:fill => '#000',
				:title => table.id
			}
			jsonified[:waiter] = table.waiter.name if table.waiter?
			jsonified[:party] = table.party?
			jsonified
	end
	
end
