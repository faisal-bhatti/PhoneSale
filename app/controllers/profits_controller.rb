class ProfitsController < ApplicationController

	def index
		@profits = Profit.where(:user_id=> current_user.id)
	end

	def create 
		@phone = Phone.find(params[:phone_id])
		@profit = @phone.build_profit
		# @profit.amount = (@phone.sold_price - @phone.price).to_s
		@profit.user_id = current_user.id
		if @profit.save
			redirect_to phones_path, notice: 'Successfully saved.'
		end
	end
end
