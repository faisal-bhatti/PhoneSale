class ProfitsController < ApplicationController

	def index
		if current_user.present?
			@profits = Profit.where(:user_id=> current_user.id)
		else
			redirect_to new_user_session_path, :notice=>"Please login first"
		end	
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
