class PartyController < ApplicationController
  
	def create
		@party = Party.create
		respond_to do |format|
			format.html { render :partial => 'new', :object => @party, :value => @party.id}
			format.js {}
		end
	end
	
	def index
	 	@parties = Party.all
	end

	def update
		@party = Party.find(params[:id])
		table = @party.table
		restaurant = table.restaurant
		if params[:event] == "bus"
			meal_price = 20
			@waiter = @party.table.waiter
			tip = @waiter.good? ? 0.50*meal_price : 0.1*meal_price
			@waiter.bank_account += tip
			@waiter.save!
			
			restaurant.bus_table meal_price
			restaurant.save!
			
			render json: {table: @party.table.id, cleared: true, waiter: @waiter.name, waiter_tip: tip, rest_balance: Restaurant.first.cash_on_hand}
			@party.table.party = nil
		end	
	end
end
